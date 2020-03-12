

function d=Jacobian( dof,Htm,typ )
 b=[ ];
 a=[];
 jaco=[];
for i=1:dof %
 a(i)= Htm(i)*Htm(i+1);
end
   b(1)=a(1);
 for j = 2:dof
       b(j)=b(j-1)*a(j)  ;
 end
for k = 1 :dof
    if (typ(k)==0)
        disp(['joint ' num2str(k) ' is revolute'])
      jv = cross((b(k)(1:3,3)), (b(dof)(1:3,4)-b(k)(1:3,4)));
      jw = b(k)(1:3,3);
      jaco(k)=[ jv jw]; 
    end
    if  (typ(k)==1)
        disp(['joint ' num2str(k) ' is prismatic'])
      jv = b(k)(1:3,3);
      jw = [0 0 0]';
      jaco(k)=[ jv jw]; 
    end
    %%for picking the jacobin we need to have 
   
end
c = jaco;
end