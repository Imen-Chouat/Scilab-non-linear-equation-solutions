///Generate a Cobwab diagram , giving a function g , the starting index x0 and the number of iteration n
function CobwebVisual(g, x0, n)
    // g : function handle
    // x0 : initial value
    // n  : number of iterations

    // Define range
    x = linspace(x0 - 2, x0 + 2, 500);
    y = g(x);

    colors = [2, 5, 3, 6, 9, 13, 15];
    clf();

    // Plot g(x) and y = x
    plot2d(x, y, style=1);     // g(x)
    e = gce(); e.children.thickness = 2;
    plot2d(x, x, style=2);     // y = x line
    e = gce(); e.children.thickness = 2;

    xlabel("x");
    ylabel("y");
    title("Cobweb Diagram Visualization");
    xgrid();
    set(gca(), "auto_clear", "off");

    // Start iterations
    for i = 1:n
        gx0 = g(x0);
        c = colors(modulo(i-1, length(colors)) + 1);

        // Draw vertical line: from (x0, x0) to (x0, g(x0))
        plot2d([x0, x0], [x0, gx0], style=c);
        // Draw horizontal line: from (x0, g(x0)) to (g(x0), g(x0))
        plot2d([x0, gx0], [gx0, gx0], style=c);

        // Mark points
        plot(x0, gx0, 'ro');
        plot(gx0, gx0, 'ko');

        sleep(500);

        // Update x0 for next iteration
        x0 = gx0;
    end
endfunction
