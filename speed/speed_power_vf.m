function speed_power_vf(vf)
    x = 0.00001:0.001:0.012;
    cat = strcat(num2str(vf{1}),'V,',num2str(vf{2}),'Hz');
    speed = cell(0);
    output = cell(0);
    for vf = {{400,50},vf}
      x2 = 18.43i*vf{end}{2}./50;
      i2 = vf{end}{1}./( 9.6+1.286.*(1./x-1) + x2);
      i_2 = abs(i2);
      r = 1.286*(1./x-1);
      n = 1500*vf{end}{2}./50;
      output{end+1} = 3*i_2.^2.*r;
      speed{end+1} = n*(1.-x);
    end
    plot(output{1},speed{1},output{1},speed{2},'.-.');
    xlabel('Output power');
    ylabel('Speed');
    legend('400V,50Hz',cat);
    grid on;
end