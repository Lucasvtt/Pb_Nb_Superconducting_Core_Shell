%------------------------------------------------------------------%
%--- Analisa Corrente e Resistencia (Kappa = 1.333, Gamma = 10) ---%
%------------------------------------------------------------------%

    %---- Limpar ----%
        close all;
        clear all;
    %----------------%
    
    %-------------------------------%
    %---------- Dimensoes ----------%
    %-------------------------------%

     L_x = 32;
     L_y = 48;
     dx = 0.2;
     dy = 0.2;
     w = (L_x - dx);

    %---------------------------------------------------%
    %--------------- Carregar arquivo IV ---------------%
    %---------------------------------------------------%
    
     load IV.dat
     J_a = IV(:,1);
     I = w * J_a;
     V = IV(:,2);
     R = diffxy(J_a, V) / w;

    %----------------------------------------%
    %------------- Reta Ohmica --------------%
    %----------------------------------------%

     sigma = 1;
     V_o = (J_a / sigma) .* (L_y - dy)';
     N = size(V_o,1);
     V(N,1) = V_o(N,1);

    %---------------------------------------%
    %------------ Grafico (IV) -------------%
    %---------------------------------------%

     figure;
     hold on;
     
     %------------------%
     % ----- Pb-Nb -----%
     % -----------------%

     % Intervalo 1
     plotData(0.442043, 0.0217524);
     text(0.97 * 0.442043, 4 * 0.0217524, '$1$', 'Interpreter', 'LaTeX', 'FontSize', 24);
     % Intervao 2
     plotData(0.55491, 0.156535);
     plotData(0.55809, 0.213395);
     text(1.035 * 0.55491, 1.1 * 0.156535, '$2$', 'Interpreter', 'LaTeX', 'FontSize', 24);
     % Intervalo 3
     plotData(0.57399, 0.36553);
     plotData(0.57558, 0.426157);
     text(1.035 * 00.57399, 1.05 * 0.36553, '$3$', 'Interpreter', 'LaTeX', 'FontSize', 24);
     % Intervalo 4
     plotData(1.15752, 1.71236);
     plotData(1.15911, 1.72587);
     text(1.02 * 1.15752, 1.71236, '$4$', 'Interpreter', 'LaTeX', 'FontSize', 24);

     %------------------%
     % ----- Pb-Pb -----%
     % -----------------%

     % Ponto 1
     plotData(0.21306, 0.125341);
     % Ponto 2
     plotData(0.29097, 0.31727);

     l_1 = plot(I, V_o, 'Color', [0, 0.4470, 0.7410], 'LineWidth', 2);
     l_2 = plot(I, V, 'Color', [0.8500, 0.3250, 0.0980], 'LineWidth', 2);
     load IV_Pb_Pb.dat;
     M = size(IV_Pb_Pb,1);
     IV_Pb_Pb(M+1,1) = 0.00925;
     IV_Pb_Pb(M+1,2) = 0.44215;
     l_3 = plot(IV_Pb_Pb(:,1) * (L_x - dx), IV_Pb_Pb(:,2), 'Color', [0.9290, 0.6940, 0.1250], 'LineWidth', 2);
     xlim([min(I), 1.025 * max(I)]);
     ylim([min(V_o), 1.05 * max(V_o)]);
     pos = 'northwest';
     leg = legend([l_1, l_2, l_3], 'Ohm', 'Pb\,-Nb core-shell Heterostructurer', 'Pb\,-Pb  Monostructurer', 'Location', pos);
     legend('boxoff');
     set(leg, 'Interpreter', 'LaTeX');
     set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
     set(gca, 'TickLength', [0.02, 0.01]);
     set(gca, 'LineWidth', 2);
     set(gca, 'TickDir', 'in');
     xlabel('$I/I_{GL}$', 'Interpreter', 'LaTeX', 'FontSize', 18);
     ylabel('$V/\varphi_{GL}$', 'Interpreter', 'LaTeX', 'FontSize', 18);
     text(min(I) + 0.05, 0.675 * max(V_o), '$\kappa_{Pb} = 0.47561$', 'FontSize', 18, 'Interpreter', 'LaTeX');
     text(min(I) + 0.05, 0.575 * max(V_o), '$\kappa_{Nb} = 1.\bar{3}$', 'FontSize', 18, 'Interpreter', 'LaTeX');
     ax = gca;
     ax.FontSize = 24;
     box on;
     set(gca, 'TickLabelInterpreter', 'LaTeX', 'FontSize', 18);
     file_nt = strcat('IV', ' _nt.png');
     file_t = strcat('IV', '_t.png');
     set(gca,'Color', [ 1 1 1]);
     background = get(gcf, 'color');
     set(gcf, 'color', [0.8 0.8 0.8]);
     set(gcf,'InvertHardCopy', 'off'); 
     print('-dpng', file_nt);
     cdata = imread(file_nt);
     imwrite(cdata,file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

%     %---------------------------------------%
%     %------------ Grafico (IR) -------------%
%     %---------------------------------------%
% 
%      figure;
%      plot(I, R, 'LineWidth', 2);
%      hold on;
%      xlim([min(I), max(I)]);
%      ylim([0, 1.1 * max(R)]);
%      pos = 'southeast';
%      set(gca,'XMinorTick', 'on', 'YMinorTick', 'on');
%      set(gca,'TickLength', [0.02, 0.01]);
%      set(gca, 'LineWidth', 2);
%      set(gca, 'TickDir', 'in');
%      xlabel('$I/I_{GL}$', 'Interpreter', 'LaTeX', 'FontSize', 18);
%      ylabel('$(dV/dI) / (\varphi_{GL} / L_{GL})$', 'Interpreter', 'LaTeX', 'FontSize', 18);
%      text(min(I) + 0.5, 0.325 * max(R), '$T = 0,\, \kappa_{Nb} = 1.\bar{3},\, \kappa_{Pb} = 0.47561$', 'FontSize', 24, 'Interpreter', 'LaTeX');
%      ax = gca;
%      ax.FontSize = 24;
%      set(gca, 'TickLabelInterpreter', 'LaTeX', 'FontSize', 24);
%      file_nt = strcat('IR', '_nt.png');
%      file_t = strcat('IR', '_t.png');
%      set(gca,'Color',[1 1 1]);
%      background = get(gcf, 'color');
%      set(gcf, 'color', [0.8 0.8 0.8]);
%      set(gcf, 'InvertHardCopy', 'off'); 
%      print('-dpng', file_nt);
%      cdata = imread(file_nt);
%      imwrite(cdata, file_t, 'png', 'BitDepth', 16, 'transparency', [0.8 0.8 0.8]);

    %------------------------------ Fim -------------------------------%

