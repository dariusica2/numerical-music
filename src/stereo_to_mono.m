function mono = stereo_to_mono(stereo)
  mono = mean(stereo, 2);
  % Normalizare
  mono = mono / max(abs(mono));
endfunction

