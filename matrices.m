function [Kref,Mref] = mat(phi)
    %calculate the matrices for question 1 a
    Kref = zeros(4,4) 
    Mref = zeros(4,4) 
    
    for i = 1:4
        for j = 1:4
            Kref(i,j) = diff(polyval(polyint(conv(polyder(polyder(phi(i,:))),polyder(polyder(phi(j,:))))), [0,1]))
            Mref(i,j) = diff(polyval(polyint(conv(phi(i,:),phi(j,:))), [0,1]))
        end
    end
    save("lsm.mat", "Mref", "Kref")
end
mat([2, -3, 0, 1 ; 1, -2, 1, 0 ; -2, 3, 0, 0 ; 1, -1, 0, 0])

