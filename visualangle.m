
function[visangle] = visualangle(distance, radius)

% distance = distance from the eye to the screen (in cm)
% radius = radius of the stimulus (in cm)

%   eye
%   d|\
%   i| \
%   s|x°\
%   t|   \
%   a|    \
%   n|     \
%   c|_     \
%   e|_|_____\
%  radius of stimulus (on screen)
     
% visangle = visual angle in degrees

visangle = atand(radius/distance);

end