# Advanced Acoustic Signal Analysis - Time-Frequency Distributions

This project focuses on the advanced analysis of acoustic signals using time-frequency distributions. The analysis is performed on both synthetic and real-world non-stationary signals. The project covers the creation of synthetic signals, analysis using frequency methods and time-frequency methods, and programming of numerical calculations for instantaneous frequency and simple time-frequency methods.

## Table of Contents

- [Introduction](#introduction)
- [Analysis on Synthetic Signals](#analysis-on-synthetic-signals)
  - [Signal Creation](#signal-creation)
  - [Frequency Method Analysis](#frequency-method-analysis)
  - [Time-Frequency Analysis](#time-frequency-analysis)
- [Analysis on Real-world Non-Stationary Signals](#analysis-on-real-world-non-stationary-signals)
  - [Frequency Method Analysis](#frequency-method-analysis-1)
  - [Time-Frequency Analysis](#time-frequency-analysis-1)
- [Programming](#programming)
  - [Numerical Calculation of Instantaneous Frequency](#numerical-calculation-of-instantaneous-frequency)
  - [Simple Time-Frequency Method Programming](#simple-time-frequency-method-programming)
- [Conclusion](#conclusion)

## Introduction

The advanced analysis of acoustic signals in the time-frequency domain is crucial for understanding the temporal and frequency characteristics of audio signals, especially non-stationary ones. This report presents an in-depth analysis of linear and quadratic time-frequency distributions applied to synthetic and real-world signals. The first part of the project focuses on the analysis of synthetic signals, providing a theoretical and methodological foundation before applying these techniques to real-world non-stationary data. The report offers an overview of time-frequency analysis methods and their use in the advanced characterization of acoustic signals.

## Analysis on Synthetic Signals

![synthetic_signal](https://github.com/MT444M/HIM-java/assets/107960014/2fdd2037-7fda-4268-b7d7-2165a9d37e71)


### Signal Creation

Two synthetic signals are created for analysis:

1. Synthetic Signal 1: Composed of multiple components, including low-frequency and slightly higher-frequency sinusoids, a punctual peak represented by a Dirac at t=256, and linear frequency modulation.
2. Synthetic Signal 2: Generated using an fmsin function with frequency modulation, a modulation frequency of 0.1 Hz, and an instantaneous frequency of 0.4 Hz, sampled at 1500 Hz.

### Frequency Method Analysis

The Discrete Fourier Transform (DFT) is applied to the synthetic signals and their associated analytic signals obtained through the Hilbert Transform. The real and imaginary parts of the DFT are presented for both the original and analytic signals.

### Time-Frequency Analysis

Theoretical expectations for the ideal time-frequency representation (TFR) of both synthetic signals are discussed. The Short-Time Fourier Transform (STFT) with a Kaiser-Bessel window is used to analyze the signals, and the influence of window size on time and frequency resolution is explored.

## Analysis on Real-world Non-Stationary Signals

![real_signal](https://github.com/MT444M/HIM-java/assets/107960014/66d11366-161f-4049-8e80-a503783f44e4)

### Frequency Method Analysis

Real-world non-stationary signals, such as animal calls and tide data, are loaded and displayed. An analysis of the frequency content of these signals is performed using the DFT.

### Time-Frequency Analysis

The time-frequency analysis of real-world signals is explored using the STFT with various window types and sizes. The signals' analytic representations are calculated to allow for better analysis of frequency components over time.

## Programming

### Numerical Calculation of Instantaneous Frequency

The numerical calculation of instantaneous frequency is implemented, and the results are compared to those obtained using MATLAB's built-in functions. The importance of choosing the appropriate method based on specific application needs is emphasized.

### Simple Time-Frequency Method Programming

Methods for calculating time-frequency representations of synthetic signals are implemented. Two signals are used: a chirp signal (frequency change over time) and a sinusoidal signal. The TFCT spectrogram is calculated using a manual method based on the TFCT formula and compared to MATLAB's built-in 'spectrogram' function.

## Conclusion

This project implements various time-frequency analysis techniques on synthetic and real-world signals. The analysis explores methods such as the Fourier Transform, spectrogram method, and other time-frequency methods. Each method has its advantages and disadvantages, and the choice of the appropriate method depends on the specific characteristics of the signal to be analyzed and the objectives of the analysis. The project provides a practical introduction to time-frequency analysis of signals, with potential applications in areas such as signal processing, pattern recognition, and bioacoustics.

## Dependencies

The project works with Matlab, but it is not a Matlab toolbox. It can be obtained from the following address: [http://tftb.nongnu.org/](http://tftb.nongnu.org/). For wavelets, there is a specific toolbox (Wavelab 850) available for download at the following address: [http://statweb.stanford.edu/~wavelab/Wavelab\_850/download.html](http://statweb.stanford.edu/~wavelab/Wavelab_850/download.html)
