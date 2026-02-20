close all;
clear all;

%--------------------------------------------------------------------------
% Define os parametros geometricos
%--------------------------------------------------------------------------

Lx = 3 * 48;
Ly = 32;
dx = 0.2;
dy = 0.2;
x = 0:dx:Lx;
y = 0:dy:Ly;

%--------------------------------------------------------------------------
% Le os arquivos psi e constroi os graficos
%--------------------------------------------------------------------------

    %-----------------------------
    % Faz o painel (a) da figura 9
    %-----------------------------
    
    jastring = '0.00670';
    eval(['load psi/', jastring, '/psi.', num2str(141)]);
        
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
    file_nt = strcat('fig_9a', ' _nt.png');
    file_t = strcat('fig_9a', '_t.png');
    set(gca,'Color', [ 1 1 1]);
    background = get(gcf, 'color');
    set(gcf, 'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %-----------------------------
    % Faz o painel (b) da figura 9
    %-----------------------------
    
    jastring = '0.00910';
    eval(['load psi/', jastring, '/psi.', num2str(141)]);
        
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
    file_nt = strcat('fig_9b', ' _nt.png');
    file_t = strcat('fig_9b', '_t.png');
    set(gca,'Color', [ 1 1 1]);
    background = get(gcf, 'color');
    set(gcf, 'color', [0.8 0.8 0.8]);
    set(gcf,'InvertHardCopy', 'off'); 
    print('-dpng', file_nt);
    cdata = imread(file_nt);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);
    imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);
