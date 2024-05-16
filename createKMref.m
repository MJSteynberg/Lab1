function createKMref()
% function createKMref()
% Helper function to create 
% - local stiffness matrix (with beta=1 and e=1) 
% - local mass matrix
% evaluated on *reference element* of length 1

% first define polynomials basis polynomials
% each line defines one of the 4 basis polynomials
psi = ...
[2,-3,0,1;
...;
...;
...];

Kref = zeros(4);
Mref = zeros(4);

% you may use polyint, conv, polyder and polyval 
% to calculate the required integrals
for ii = 1:4
    for jj = 1:4
        phii = psi(ii,:);
        phij = psi(jj,:);
        int = polyint...
        Mref(ii,jj) = ...
        
        d2phii = polyder...
        d2phij = ...
        int = ...
        Kref(ii,jj) = ...
    end
end

save('lsm.mat','Kref','Mref');
    
end