function [S f t] = spectrogram(signal, fs, window_size)
  n = length(signal);
  % Calculare numar de ferestre
  window_number = floor(n / window_size);
  % Initializare spectograma
  S = zeros(window_size, window_number);
  % Pentru fiecare fereastra
  for i = 1 : window_number
    window = signal(1 + (i - 1) * window_size : i * window_size);
    % Produs Hadamard
    window = window .* hanning(window_size);
    % Aplicare FFT cu rezolutia dubla
    fft_vector = fft(window, 2 * window_size);
    % Eliminare parte conjugata
    fft_vector = fft_vector(1 : window_size);
    % Stocare in spectograma
    S(:, i) = abs(fft_vector);
  endfor
  f = linspace(0, ((window_size - 1) * fs) / (2 * window_size) , window_size);
  f = f';
  t = linspace(0, (window_number - 1) * window_size / fs, window_number);
  t = t';
endfunction