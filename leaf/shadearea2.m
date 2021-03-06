function shadow=shadearea2(shadowx,shadowy,jd,no)
%jd为搜索网格的精度
  w=(((rand(1)*((360)/no)))/180)*(pi);
  [m,n]=size(shadowx);
  for a=1:no
      cosw(a)=cos(w+((2*pi)/no)*(a-1));
      sinw(a)=sin(w+((2*pi)/no)*(a-1));
  end
            maxx=max(max(shadowx));
            minx=min(min(shadowx));
            row=fix((maxx+0.2-minx)/jd);
 for mm=1:row
        xx=minx-0.1+jd*(mm);
     for nn=1:row
         yy=minx-0.1+jd*(nn);
        for i=1:m
            for jj=1:n
            for j=1:no
                xx1(j)=xx*cosw(j)+yy*sinw(j)-shadowx(i,jj)*cosw(j)-shadowy(i,jj)*sinw(j);
                yy1(j)=-xx*sinw(j)+yy*cosw(j)+shadowx(i,jj)*sinw(j)-shadowy(i,jj)*cosw(j);
                if (4*(xx1(j)-0.05)^2)/0.0036+(4*(yy1(j))^2)/0.0009<=1.1 
                    shadow(mm,nn)=1;
                    %shadow3=shadow3+1;
%                 else shadow(mm,nn)=1;
                end
            end
            end
        end     
     end 
 end
 %shadow=(shadow*jd*jd)/((2^N1)*no*pi*0.03*0.015);
 %sum(sum(shadow))
