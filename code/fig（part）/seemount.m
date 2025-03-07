clear all;
clc
close all
%POM��ɽģ�������ӻ�
%ʱ��2022��6��7��15:14:47
%�ص����¥611������һ�����ൺ
%����POM���еĺ�ɽģ���pom2k.out�ļ��������ӻ�
% load('pom2k.out')
% load('IC.dat')
% S2k='F:\FIO-IBM\POMSeamountle\pom2k.nc';
%S2k='F:\FIO-IBM\POMSeamountle\pomle.nc';
S2k='E:\0306\datale\pom2kba-ibm-2.nc';
%%%%%%%%%%%%%%%%S2k='F:\FIO-IBM\POMSeamountle\lebFD.nc';
%S2k='F:\FIO-IBM\POMSeamountle\adv1.nc';

% ncdisp('F:\xiaole\HadISST_sst.nc')

ncdisp(S2k)
time=ncread(S2k,'time');
z=ncread(S2k,'z');
zz=ncread(S2k,'zz');
dx=ncread(S2k,'dx');
dy=ncread(S2k,'dy');
east_u=ncread(S2k,'east_u');
east_v=ncread(S2k,'east_v');
east_e=ncread(S2k,'east_e');
east_c=ncread(S2k,'east_c');
north_u=ncread(S2k,'north_u');
north_v=ncread(S2k,'north_v');
north_e=ncread(S2k,'north_e');
north_c=ncread(S2k,'north_c');
rot=ncread(S2k,'rot');%Rotation angle of x-axis wrt. east; coordinates = 'east_e north_e'
h=ncread(S2k,'h');  %undisturbed water depth; coordinates = 'east_e north_e'
t=ncread(S2k,'t');  % potential temperature;  east_e north_e zz
s=ncread(S2k,'s');  % salinity x rho / rhoref;  east_e north_e zz
rho=ncread(S2k,'rho');%(density-1000)/rhoref; east_e north_e zz
u=ncread(S2k,'u');  % x-velocity;  east_u north_u zz
v=ncread(S2k,'v');

%%
subplot(2,3,1)
mesh(east_e,north_e,t(:,:,10,2))
title('�¶�ˮƽ����:z=10')

for i=1:65
    for j=1:21
        ty(i,j)=t(i,26,j,2);
    end
end

subplot(2,3,2)
mesh(zz,east_e(:,26),ty)
title('�¶ȴ������棺y=26')

for i=1:49
    for j=1:21
        tx(i,j)=t(32,i,j,2);
    end
end
subplot(2,3,3)
mesh(zz,north_e(32,:),tx)
title('�¶ȴ������棺x=32')

%%
subplot(2,3,4)
mesh(east_e,north_e,s(:,:,10,2))
title('�ζ�ˮƽ����:z=10')

for i=1:65
    for j=1:21
        sy(i,j)=s(i,26,j,2);
    end
end
subplot(2,3,5)
mesh(zz,east_e(:,26),sy)
title('�ζȴ������棺y=26')

for i=1:49
    for j=1:21
        sx(i,j)=s(32,i,j,2);
    end
end
subplot(2,3,6)
mesh(zz,north_e(32,:),sx)
title('�ζȴ������棺x=32')


figure
pcolor(east_e,north_e,h)
view(0,90)
shading interp; 
colorbar; colormap(cool);
ax=gca;
ax.ZDir='reverse';


figure
surf(east_e,north_e,h)
view(0,90)
shading interp; 
colorbar; colormap(colorcube);
ax=gca;
ax.ZDir='reverse';








% view(2)
% figure
% contour(east_e,north_e,-h,40)
% 
% 
% t2=t(:,:,8,3);
% % figure
% % mesh(east_e,north_e,t2)
% % view(2)
% figure
% contour(east_e,north_e,t2,40)

% t3=t(:,(end-1)/2,:,3);
% figure
% contour(east_e,zz,t3,40)
% 
% u2=u(:,:,1,3);











% fn = ��E:\study\file.nc��; %�˴�Ϊ�ļ��Ĵ洢·����fileΪ�ļ���
% 
% %������nc�ļ��еı���
% nccreate(fs, ��Input-windspeed-for-model��,��
% ��Dimensions��, {��latitude��,144,��longitude��,144,��time��,576},��
% ��FillValue��,��disable��);
% %����Fillvalue����Ϊdisable�ǲ�����matlab��Ĭ��ֵ�����ľ���
% 
% ncwrite(fs,��Input-windspeed-for-model��,gt) %�����ݴ洢���ñ�����
% ncwriteatt(fs,��Input-windspeed-for-model��,��units��,��meters per second��) %���ñ���������
% ncwriteatt(fs,��Input-windspeed-for-model��,��missing_value��,��nan��) %���ñ���������
% 
% ncdisp(fn) %---- �洢������ncdisp������ʾ���ļ��е����б���
% ncdisp(fn����Input-windspeed-for-model��) %---- ָ����ʾĳ����
% 
% ����ϸ�ڣ���鿴Matlab�������������ӣ�
% https://ww2.mathworks.cn/help/matlab/network-common-data-form.html?s_tid=CRUX_lftnav
% ��������������������������������
% ��Ȩ����������ΪCSDN��������ɵĹ�2����ԭ�����£���ѭCC 4.0 BY-SA��ȨЭ�飬ת���븽��ԭ�ĳ������Ӽ���������
% ԭ�����ӣ�https://blog.csdn.net/gourmet2/article/details/123239087