function [Mglob] = createMglob (Mloc, d_h)
% function [Mglob] = createMglob (Mloc, d_h)
% Mloc   :    local stiffness matrix on element of length h
% d_h    :    number of intervals in partition Delta_h
% Mglob  :    global stiffness matrix (after application of b.c.)
    
% Initialize
Mglob = sparse(2*(d_h+1), 2*(d_h+1));

% Assemble



end
