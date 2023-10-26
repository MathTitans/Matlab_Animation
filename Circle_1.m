function Circle_1(x,y,r)

    
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;

    fig_video = figure(1);
    counter = 1;

    for i = 1:length(th)
        
        % hold off
        plot(xunit(1:i), yunit(1:i), '-k', 'LineWidth', 5);
        hold on
        title('Circle Animation', 'Interpreter','latex')
        % plot(xunit(i), yunit(i), 'or', 'MarkerSize',15, 'markerfacecolor', 'r');


        box on
        grid on
        xlim([-5, 5])
        ylim([-5, 5])
        xlabel('X', 'Interpreter','latex')
        ylabel('Y', 'Interpreter','latex')
        set(gca, 'fontsize', 23, 'TickLabelInterpreter','latex')
        drawnow;

        movie(counter) = getframe(fig_video);
        counter = counter + 1;
        
    end


    myWriter = VideoWriter('Circle','MPEG-4');
    myWriter.FrameRate = 10;
    open(myWriter);
    writeVideo(myWriter,movie);
    close(myWriter);


end