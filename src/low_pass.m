function signal = low_pass(signal, fs, cutoff_freq)
  % FFT pentru semnal
  fft_vector = fft(signal);
  [l c] = size(signal);
  % Computare frecvente posibile
  f = linspace(0, ((l - 1) * fs) / l , l);
  f = f';
  % Creare masca
  mask = f < cutoff_freq;
  % Aplicare inversa transformatei Fourier
  signal = ifft(fft_vector .* mask);
  % Normalizare
  signal = signal / max(abs(signal));
endfunction

