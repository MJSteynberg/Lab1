function [Mglob] = createMglob (Mloc, d_h)
    % function [Mglob] = createMglob (Mloc, d_h)
    % Mloc   :    local stiffness matrix on element of length h
    % d_h    :    number of intervals in partition Delta_h
    % Mglob  :    global stiffness matrix (after application of b.c.)
        
    % Initialize
    Mglob = sparse(2*d_h+2, 2*d_h+2);
    
    % Assemble
    for l=1:d_h
        % blow up local stiff mat to full dimensions and add to Mglob
        Mlocfull = spalloc(2*d_h+2, 2*d_h+2,4*4);
        for x=1:4
            for y=1:4
                Mlocfull(2*(l-1)+x, 2*(l-1) + y) = Mloc(x,y);
            end 
        end 
        Mglob = Mglob + Mlocfull;
    end
    % Reduce local stiffness matrices
    % according to boundary conditions
    dim = 2*d_h;
    
    I = eye(dim);
    P = zeros(dim, dim+2);
    P(:,2:dim+1) = I;

    Mglob = P*Mglob*P';
end

