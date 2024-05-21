function [Mglob] = createMglob (Mloc, d_h)
    % function [Mglob] = createMglob (Mloc, d_h)
    % Mloc   :    local stiffness matrix on element of length h
    % d_h    :    number of intervals in partition Delta_h
    % Mglob  :    global stiffness matrix (after application of b.c.)
        
    % Initialize
    Mglob = sparse(2*(d_h+1), 2*(d_h+1));
    
    % Assemble
    for l=1:d_h
        Mlocfull = spalloc(2*d_h+2, 2*d_h+2,4*4);
        for x=1:4
            for y=1:4
                Mlocfull(2*(l-1)+x, 2*(l-1) + y) = Mloc(x,y);
            end 
        end 
        Mglob = Mglob + Mlocfull;
    end

    dim = 2*d_h;
    
    I = eye(dim);
    P = zeros(dim, dim+2);
    P(:,2:dim+1) = I;

    Mglob = P*Mglob*P';
end

