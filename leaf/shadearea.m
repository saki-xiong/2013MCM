function shadow=shadearea(jd,x2,y2,no,N) 
%jd为搜索网格的精度
shadow=1;
  w=(((rand(1)*((360)/no)))/180)*(pi);
  for a=1:no
      cosw(a)=cos(w+((2*pi)/no)*(a-1));
      sinw(a)=sin(w+((2*pi)/no)*(a-1));
  end
            maxx=max(x2(3,:));
            minx=min(x2(3,:));
            row=fix((maxx+0.2-minx)/jd);
 for mm=1:row
        xx=minx-0.1+jd*(mm);
     for nn=1:row
         yy=minx-0.1+jd*(nn);
        for i=1:2^N
            for j=1:no
                xx1(j)=xx*cosw(j)+yy*sinw(j)-x2(3,i)*cosw(j)-y2(3,i)*sinw(j);
                yy1(j)=-xx*sinw(j)+yy*cosw(j)+x2(3,i)*sinw(j)-y2(3,i)*cosw(j);
                if (4*(xx1(j)-0.05)^2)/0.0036+(4*(yy1(j))^2)/0.0009<=1.1 
                    shadow(mm,nn)=1;
                end
            end
        end     
     end 
 end
 shadow=(sum(sum(shadow))*jd*jd)/((2^N)*no*pi*0.03*0.015)
 
