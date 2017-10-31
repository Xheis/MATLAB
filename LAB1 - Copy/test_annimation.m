% Sure, here's a simple example.
% 
% First we create an object. I'm using patch because it's good at 
% all sorts of 2D shapes, and I'm putting it into a hgtransform because 
% that will make it easy to move around:
PenH = 3;
PenW = 0.2;

x = [-PenW,-PenW,PenW,PenW];
y = [0,PenH,PenH,0];
Pen = hgtransform;
patch('XData',x,'YData',y,'FaceColor','yellow','Parent',Pen)

% Now we set up the coordinate system we want to move around in.
% The axis equal means that the scale in the X & Y directions will
% be the same, rather than the arbitrary scaling you use for charts.

pt1 = [0 0 0];
pt2 = [2 0 0];
xlim([-5 5])
ylim([-1 5])


% And then we can easily move between two points like this. 
% The basic idea is to do linear interpolation between the 
% two points and give the result to the makehgtform function 
% to get a transform matrix. The hgtransform object will use 
% that to move the patch.

time = 100;
cycles = 10;

theta = 3;
x = -1.5;

for t=linspace(0,cycles*2*pi,time)
  
  Pen.Matrix = makehgtform('translate',pt1 + t/(x*cycles*2*pi)*(pt2-pt1),'zrotate', sin(theta));
  %Pen.Matrix = makehgtform();
  drawnow
end

% We can easily add in scaling and rotating too.
% % 
% % s1 = 1/2;
% % s2 = 2;
% % r1 = 0;
% % r2 = 2*pi/3;
% % for t=linspace(0,1,100)
% %   g.Matrix = makehgtform('translate',pt1 + t*(pt2-pt1), ...
% %                          'scale',s1 + t*(s2-s1), ...
% %                          'zrotate',r1 + t*(r2-r1));
% %   drawnow
% % end