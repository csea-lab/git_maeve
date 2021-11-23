function vertmarks(marks, color, linesize)
% marks your plot with a vertical line
% input -> mark (sample points), color, linesize
switch nargin
    case 2
        linesize = 3;
    case 1
        linesize = 3;
        color = 'k--';
    case 0
        warning('seriously? not even 1 argument? where do you want your marks?')
end
    for x = 1:length(marks)
        fig = gcf; % current figure handle
        hold on
        set(gca,'fontsize', 25)
        set(gcf,'color','w');
        set(gca,'box','off');
        grid off
        y = get(gca,'ylim');
        plot([marks(x) marks(x)], y, color, 'linewidth', linesize)
        hold off
        grid off
    end
end
