close all;
clear all;

%--------------------------------------------------------------------------
% Define os parametros geometricos
%--------------------------------------------------------------------------

Lx = 3 * 48;
Ly = 32;
a = 28.8;
b = 1.6;
dx = 0.2;
dy = 0.2;
x = 0:dx:Lx;
y = 0:dy:Ly;

%--------------------------------------------------------------------------
% Le os arquivos psi e constroi os graficos
%--------------------------------------------------------------------------

    %-----------------------------
    % Faz o painel (a) da figura 3
    %-----------------------------
    
    jastring = '0.01385';
    eval(['load psi/', jastring, '/psi.', num2str(1904)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');
    axis equal;
    axis tight;
    axis xy;
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1),P(:,2),'w');
    text(0.6, 28, '(a)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_3a', ' _nt.png');
    file_t = strcat('fig_3a', '_t.png');
    set(gca,'Color', [ 1 1 1]);
    background = get(gcf, 'color');
    set(gcf, 'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (b) da figura 3
    %-----------------------------
    
    jastring = '0.01385';
    eval(['load psi/', jastring, '/psi.', num2str(1908)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1),P(:,2),'w');
    text(0.6, 28, '(b)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_3b', ' _nt.png');
    file_t = strcat('fig_3b', '_t.png');
    set(gca,'Color', [ 1 1 1]);
    background = get(gcf, 'color');
    set(gcf, 'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);


    %-----------------------------
    % Faz o painel (c) da figura 3
    %-----------------------------
    
    jastring = '0.01385';
    eval(['load psi/', jastring, '/psi.', num2str(1909)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1),P(:,2),'w');
    text(0.6, 28, '(c)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_3c', ' _nt.png');
    file_t = strcat('fig_3c', '_t.png');
    set(gca,'Color', [ 1 1 1]);
    background = get(gcf, 'color');
    set(gcf, 'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (d) da figura 3
    %-----------------------------
    
    jastring = '0.01385';
    eval(['load psi/', jastring, '/psi.', num2str(1912)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1),P(:,2),'w');
    text(0.6, 28, '(d)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_3d', ' _nt.png');
    file_t = strcat('fig_3d', '_t.png');
    set(gca,'Color', [ 1 1 1]);
    background = get(gcf, 'color');
    set(gcf, 'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %----------------------------------------------------------------------
    %----------------------------------------------------------------------

    %-----------------------------
    % Faz o painel (a) da figura 4
    %-----------------------------
    
    jastring = '0.01745';
    eval(['load psi/', jastring, '/psi.', num2str(20)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2), 'w');
    text(0.6, 28, '(a)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_4a', ' _nt.png');
    file_t = strcat('fig_4a', '_t.png');
    set(gca,'Color', [ 1 1 1]);
    background = get(gcf, 'color');
    set(gcf, 'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (b) da figura 4
    %-----------------------------
    
    jastring = '0.01745';
    eval(['load psi/', jastring, '/psi.', num2str(21)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x,  y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2), 'w');
    text(0.6, 28, '(b)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_4b', ' _nt.png');
    file_t = strcat('fig_4b', '_t.png');
    set(gca,'Color', [ 1 1 1]);
    background = get(gcf, 'color');
    set(gcf, 'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %----------------------------------------------------------------------
    %----------------------------------------------------------------------

    %-----------------------------
    % Faz o painel (a) da figura 5
    %-----------------------------
    
    jastring = '0.01755';
    eval(['load psi/', jastring, '/psi.', num2str(69)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible','off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2), 'w');
    text(0.6, 28, '(a)', 'Interpreter','LaTeX', 'FontSize',16, 'Color', 'k');
    file_nt = strcat('fig_5a', '_nt.png');
    file_t = strcat('fig_5a', '_t.png');
    set(gca,'Color',[1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (b) da figura 5
    %-----------------------------
    
    jastring = '0.01755';
    eval(['load psi/',  jastring, '/psi.' , num2str(91)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x,y,interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible',' off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2),' w');
    text(0.6, 28, '(b)', 'Interpreter', 'LaTeX','FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_5b', '_nt.png');
    file_t = strcat('fig_5b', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (c) da figura 5
    %-----------------------------
    
    jastring = '0.01755';
    eval(['load psi/', jastring, '/psi.', num2str(122)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2),' w');
    text(0.6, 28, '(c)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_5c', '_nt.png');
    file_t = strcat('fig_5c', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (d) da figura 5
    %-----------------------------
    
    jastring = '0.01755';
    eval(['load psi/', jastring, '/psi.', num2str(168)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x,y,interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2), 'w');
    text(0.6, 28, '(d)','Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_5d', '_nt.png');
    file_t = strcat('fig_5d', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %----------------------------------------------------------------------
    %----------------------------------------------------------------------

    %-----------------------------
    % Faz o painel (a) da figura 6
    %-----------------------------
    
    jastring = '0.01805';
    eval(['load psi/', jastring, '/psi.', num2str(14)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible','off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2), 'w');
    text(0.6, 28, '(a)', 'Interpreter','LaTeX', 'FontSize',16, 'Color', 'k');
    file_nt = strcat('fig_6a', '_nt.png');
    file_t = strcat('fig_6a', '_t.png');
    set(gca,'Color',[1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (b) da figura 6
    %-----------------------------
    
    jastring = '0.01805';
    eval(['load psi/',  jastring, '/psi.' , num2str(40)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x,y,interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible',' off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2),' w');
    text(0.6, 28, '(b)', 'Interpreter', 'LaTeX','FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_6b', '_nt.png');
    file_t = strcat('fig_6b', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (c) da figura 6
    %-----------------------------
    
    jastring = '0.01805';
    eval(['load psi/', jastring, '/psi.', num2str(62)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2),' w');
    text(0.6, 28, '(c)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_6c', '_nt.png');
    file_t = strcat('fig_6c', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (d) da figura 6
    %-----------------------------
    
    jastring = '0.01805';
    eval(['load psi/', jastring, '/psi.', num2str(87)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x,y,interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2), 'w');
    text(0.6, 28, '(d)','Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_6d', '_nt.png');
    file_t = strcat('fig_6d', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %----------------------------------------------------------------------
    %----------------------------------------------------------------------

    %-----------------------------
    % Faz o painel (a) da figura 7
    %-----------------------------
    
    jastring = '0.01810';
    eval(['load psi/', jastring, '/psi.', num2str(1256)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible','off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2), 'w');
    text(0.6, 28, '(a)', 'Interpreter','LaTeX', 'FontSize',16, 'Color', 'k');
    file_nt = strcat('fig_7a', '_nt.png');
    file_t = strcat('fig_7a', '_t.png');
    set(gca,'Color',[1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (b) da figura 7
    %-----------------------------
    
    jastring = '0.01810';
    eval(['load psi/',  jastring, '/psi.' , num2str(1260)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x,y,interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible',' off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2),' w');
    text(0.6, 28, '(b)', 'Interpreter', 'LaTeX','FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_7b', '_nt.png');
    file_t = strcat('fig_7b', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (c) da figura 7
    %-----------------------------
    
    jastring = '0.01810';
    eval(['load psi/', jastring, '/psi.', num2str(1264)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca, 'visible', 'off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2),' w');
    text(0.6, 28, '(c)', 'Interpreter', 'LaTeX', 'FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_7c', '_nt.png');
    file_t = strcat('fig_7c', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);


    %----------------------------------------------------------------------
    %----------------------------------------------------------------------

    %-----------------------------
    % Faz o painel (a) da figura 8
    %-----------------------------
    
    jastring = '0.03640';
    eval(['load psi/', jastring, '/psi.', num2str(10)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x, y, interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible','off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2), 'w');
    text(0.6, 28, '(a)', 'Interpreter','LaTeX', 'FontSize',16, 'Color', 'k');
    file_nt = strcat('fig_8a', '_nt.png');
    file_t = strcat('fig_8a', '_t.png');
    set(gca,'Color',[1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (b) da figura 8
    %-----------------------------
    
    jastring = '0.03645';
    eval(['load psi/',  jastring, '/psi.' , num2str(631)]);
        
    % Aplica as condicoes periodicas e contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx + 2: 3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 
    
    figure;
    colormap('turbo');
    imagesc(x,y,interp2(rot90(psi)), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');    
    axis equal;
    axis tight;
    axis xy;
    set(gca,'XTick', []);
    set(gca,'YTick', []);
    set(gca,'visible',' off')
    hold on;
    P = [0 24 ; 8 24; 8 32; 0 32];
    patch(P(:,1), P(:,2),' w');
    text(0.6, 28, '(b)', 'Interpreter', 'LaTeX','FontSize', 16, 'Color', 'k');
    file_nt = strcat('fig_8b', '_nt.png');
    file_t = strcat('fig_8b', '_t.png');
    set(gca,'Color', [1 1 1]);
    background = get(gcf, 'color');
    set(gcf,'color',[0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);
