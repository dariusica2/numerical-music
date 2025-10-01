function x = oscillator(freq, fs, dur, A, D, S, R)
  t = 0 : 1 / fs : dur - 1 / fs;
  sine_wave = sin(2 * pi * freq * t);
  sine_wave = sine_wave';
  % Calculare numar total de sample-uri
  total_samples = length(t);
  % Calculare sample-uri folosind parametrii envelope-ului
  attack_samples = floor(A * fs);
  decay_samples = floor(D * fs);
  release_samples = floor(R * fs);
  sustain_samples = total_samples - (attack_samples + decay_samples + release_samples);
  % Construire sunet pe baza parametrilor envelope-ului
  attack_envelope = linspace(0, 1, attack_samples);
  attack_envelope = attack_envelope';
  decay_envelope = linspace(1, S, decay_samples);
  decay_envelope = decay_envelope';
  sustain_envelope = ones(sustain_samples, 1) * S;
  release_envelope = linspace(S, 0, release_samples);
  release_envelope = release_envelope';
  % Punere laolalta envelope
  envelope = [attack_envelope; decay_envelope; sustain_envelope; release_envelope];
  % Produs Hadamard pentru a obtine rezultatul final
  x = sine_wave .* envelope;
endfunction

