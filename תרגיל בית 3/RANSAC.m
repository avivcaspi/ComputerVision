function [H, inliers_maches] = RANSAC(matches, frames1, frames2, num_iter)
threshold = 5;
frames1_pts = frames1(1:2, matches(1,:));
frames2_pts = frames2(1:2, matches(2,:));
frames2_homo = cat(1, frames2_pts, ones(1, size(frames2_pts,2)));
frames_pairs_pts = cat(1, frames1_pts, frames2_pts);

max_correct = 0;
max_correct_pts = [];

for iter=1:num_iter
    pair_indices = randi([1, size(frames_pairs_pts,2)],4,1);
    pts = frames_pairs_pts(:, pair_indices);
    h = findProjective(pts);
    
    frames2_projected = h * frames2_homo;
    frames2_projected = frames2_projected ./ frames2_projected(3,:);
    
    error = sqrt(sum((frames1_pts - frames2_projected(1:2, :)) .^ 2, 1));
    correct_pts = error < threshold;
    n_correct = sum(correct_pts);
    if max_correct < n_correct
        max_correct = n_correct;
        max_correct_pts = frames_pairs_pts(:, correct_pts);
    end 
end
H = findProjective(max_correct_pts);

frames2_projected = H * frames2_homo;
frames2_projected = frames2_projected ./ frames2_projected(3,:);
error = sqrt(sum((frames1_pts - frames2_projected(1:2, :)) .^ 2, 1));
correct_pts = error < threshold;

inliers_maches =  find(correct_pts);
end

