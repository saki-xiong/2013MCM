clc%�����Ŵ��㷨��������Ժ��������ֵ��eafunΪĿ�꺯����boundsΪ�߽�.
initPop=initializega(10,bounds,'eafun');
plot (initPop(:,1),initPop(:,2),'g+')
[x endPop] = ga(bounds,'eafun',[],initPop,[1e-6 1 1],'maxGenTerm',1,...
  'normGeomSelect',[0.08],['arithXover'],[2 0],'nonUnifMutation',[2 1 3]);
plot (endPop(:,1),endPop(:,2),'ro')
[x endPop] = ga(bounds,'eafun',[],initPop,[1e-6 1 1],'maxGenTerm',25,...
  'normGeomSelect',[0.08],['arithXover'],[2],'nonUnifMutation',[2 25 3]);
x
plot (endPop(:,1),endPop(:,2),'y*')