# Numerical Music (Audio Signal Processing & Synthesis)

A MATLAB-based project for audio synthesis, processing, and analysis with various digital signal processing effects and visualization tools.

## Project Overview

This project provides a comprehensive suite of audio processing functions including:
- Audio synthesis with ADSR envelope control
- Reverberation effects using impulse responses
- Frequency filtering (low-pass)
- Spectrogram visualization
- Pattern-based music composition

## File Structure

### Core Audio Processing
- **apply_reverb.m** - Applies reverberation to audio signals using convolution with impulse responses
- **low_pass.m** - Implements low-pass filtering using FFT-based frequency masking
- **stereo_to_mono.m** - Converts stereo audio to mono and normalizes

### Audio Synthesis
- **create_sound.m** - Main function for generating sounds from pattern files
- **create_instruments.m** - Creates instrument mappings from configuration files
- **oscillator.m** - Generates synthesized sounds with ADSR envelope control
- **parse_pattern.m** - Parses musical patterns for sequence generation

### Analysis & Visualization
- **spectrogram.m** - Computes spectrograms using FFT with Hanning windows
- **plot_spectrogram.m** - Visualizes spectrograms with logarithmic scaling

### Main Script
- **studio.m** - Main demonstration script that processes various audio files and generates comparative analyses

## Usage

### Basic Audio Processing
```matlab
% Apply reverb to a signal
[sig, fs] = audioread('audio.wav');
[impulse_response, ~] = audioread('s1r1.wav');
sig_reverb = apply_reverb(sig, impulse_response);

% Apply low-pass filter
sig_filtered = low_pass(sig, fs, 1000); % 1000 Hz cutoff