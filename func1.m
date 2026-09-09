function [coords, res] = func1(img)
  modules = [];
  for i = 1:size(img, 1)
    for j = 1:size(img, 2)
      module = 0;
      for c = 1:3
        module = module + double(img(i, j, c)) ^ 2;
      endfor
      module = sqrt(module);
      modules(end + 1) = module;
    endfor
  endfor
  average = sum(modules) / length(modules);
  avg_sqr = 0;
  for i = 1:length(modules)
    avg_sqr = avg_sqr + (modules(i) - average) ^ 2;
  endfor
  avg_sqr = sqrt(avg_sqr / length(modules));
  ind = 1;
  coords = [];
  for i = 1:size(img, 1)
    for j = 1:size(img, 2)
      if modules(ind) - average > 3 * avg_sqr
        k = (3 * avg_sqr + average) / modules(ind);
        img(i, j, :) = img(i, j, :) * k;
        coords(end + 1, :) = [i, j];
      elseif modules(ind) - average < -3 * avg_sqr
        k = (-3 * avg_sqr + average) / modules(ind);
        img(i, j, :) = img(i, j, :) * k;
        coords(end + 1, :) = [i, j];
      endif
      ind = ind + 1;
    endfor
  endfor
  res = img;
endfunction
