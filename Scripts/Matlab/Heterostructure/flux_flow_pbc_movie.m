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
% Define o primeiro e ultimo psi, a corrente aplicada
% e o nome de arquivo de video
%--------------------------------------------------------------------------

jastring = '0.03645'; % MUDE O VALOR DA CORRENTE.
% file = strcat('psi_move.mp4');
file = strcat('S4b.mp4');
cmd = ['mv' ' ' file ' ' 'psi/', jastring];
vidfile = VideoWriter(file, 'MPEG-4');
open(vidfile);
titulo = strcat('$Pb-Nb\,, \eta = 1\,, J_a=\,$', jastring);
i_initial  = 726 - 100;
i_final = 726;

%--------------------------------------------------------------------------
% Le os arquivos psi e constroi a animacao
%--------------------------------------------------------------------------

for nn = i_initial:1:i_final

    titulo = strcat('$Pb-Nb\,, \eta = 1\,, J_a=\,$', jastring, ',\,frame = ', num2str(nn));

    CiCountT = num2str(nn);

    % Carega o arquivo psi
    eval(['load psi/', jastring, '/psi.', CiCountT]);
    
    % Aplica as condicoes periodicas de contorno
    [Nx, Ny] = size(psi);
    Nx = Nx - 1;
    Ny = Ny - 1;
    for j = Nx +  2:3 * Nx + 1
        psi(j,:) = psi(j-Nx,:);
    end 

    colormap('turbo');
    imagesc(x, y, rot90(psi), [0 sqrt(1 - 0.75)]);
    line([0 Lx], [b b], 'Color', 'white', 'LineStyle', '--');
    line([0 Lx], [a + b a + b], 'Color', 'white', 'LineStyle', '--');
    axis equal;
    axis tight;
    axis xy;
    xlabel('$x/\xi$', 'Interpreter', 'LaTeX', 'FontSize', 14);
    ylabel('$y/\xi$', 'Interpreter', 'LaTeX', 'FontSize', 14);
    % set(gca,'XTick',[]);
    % set(gca,'YTick',[]);
    title(titulo, 'position', [Lx / 2  1.05 * Ly], 'Interpreter', 'LaTeX','FontSize', 14);
    set(gca, 'TickLabelInterpreter', 'LaTeX', 'FontSize', 14);
    set(gca, 'LineWidth', 1.5);
    set(gca, 'TickDir', 'in');

    f = getframe(gcf);
    writeVideo(vidfile,f);

end

close(vidfile);
system(cmd);
close all;