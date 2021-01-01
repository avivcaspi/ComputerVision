function reconImage = imRecon(Laplacians)
    reconImage = zeros(size(Laplacians{1}));
    for i=0:size(Laplacians)-1
        reconImage = reconImage + Laplacians{i + 1};
    end
end
