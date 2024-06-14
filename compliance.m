function [ce, dce] = compliance (e,Kloc,ff) 
% function [ce, dce] = compliance (e,Kloc,ff) 
% e      :   design vector (algebraic form)
% Kloc   :   local stiffness matrix on element of length h
% ff     :   nodal force vector
% ce     :   value of compliance functional for design e
% dce    :   gradient of compliance functional evaluated at design e

    d_h = length(e);
    
    % assemble global stiffness matrix
   
    Kglob = createKglob (e, Kloc);
    
    % solve equilibrium equation
    
    q = Kglob\ff;
    ce = ff'*q;
    
    % Gradient
    if nargout > 1
      dce = zeros(d_h, 1);  
      for i=1:d_h
        % compute partial derivative
        dce(i) = -3/e(i)*q'*Kglob*q
      end
    end
    
end
