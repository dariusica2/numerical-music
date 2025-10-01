function signal = apply_reverb(signal, impulse_response)
  % Transformare in semnal mono
  impulse_response = stereo_to_mono(impulse_response);
  % Computare convolutie
  signal = fftconv(signal, impulse_response);
  % Normalizare
  signal = signal / max(abs(signal));
endfunction

