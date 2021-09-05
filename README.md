# Advanced Signal Processing
This repository contains the assignments for the Academic Course "Advanced Signal Processing Techniques" taught in the Spring of 2020-2021 in Aristotle University of Thessaloniki - Electrical & Computer Engineering. 20-21.<br />
The repo consists of 4 Homework assignment tasks, where each folder has its own Homework presentanion, its Matlab files and its final report discussing the results, respectively.<br />
Each report was written in LaTex using Overleaf.<br />

## HW 1 - HOS intuition
Given that **X(k) = W(k) - W(k-1)**, where **W(k)**  is a stationary stochastic process with independent, identically distributed (i.i.d) stochastic variables
- Calculate the 3rd order cumulants of **X(k)**.
- Calculate the skewness of **X(k)**.
- Calculate the bispectrum of **X(k)**.
- Draw a general comment for the above results.

## HW 2 - Quadratic Phase Coupling detection
Consider **X(k)** is a sum of 6 sinusoidal qudratically phase coupled functions and the length of the data is N = 8192.
- Construct **X(k)**.
- Estimate the power spectrum of **X(k)** using L = 128 max shiftings for the autocorrelation function. The power spectrum was also estimated using the function SpectrumEstimator from the dsp toolbox. We chose Welch's averaged modified periodograms method and Hann's window function.
- Estimate the bispectrum using the indirect method with a rectangural window or a Parzen window as your window function.
- Estimate the bispectrum using the direct method and compare the abovementioned bispectrum estimation methods.
- Observe the QPC phenomenon and draw a general comment regarding the frequency observed in the power spectrum vs the bispectrum.
- Repetition of the aforementioned steps using different parameters.

## HW 3 - Validity check of Giannakis' formula
A discrete signal x(k) is created as an output of a q=5th order Moving Average (MA-5) process. The coefficients are b = (1.0, 0.93, 0.85, 0.72, 0.59, −0.10). The input of our linear system is a non-Gaussian white noise. An exponential distribution with mean value equal to 1 is used in order to create the v(k) signal, where v = exprnd(1,[1,2048]);
- Justify the non-Gaussian character of v(k) via its skewness. The skewness was calculated manually and for verification we used the skew function from MATLAB.
- Estimate the 3rd order cumulants of x(k) using the indirect method.

###### Giannakis' formula
An MA model has a finite impulse response (FIR) and Giannakis was the first to show that the Impulse Response of a qth-order MA system can be calculated just from the system’s output cumulants using the following simple closed-form formula (stated here in terms of third-order cumulants). <br />
Note, this formula requires exact knowledge of MA order q. It may be impractical from an actual computation point of view because the output cumulant must be estimated, and does not provide any filtering to reduce the effects of cumulant estimation errors. Given this formula,
- Estimate the impulse response of the MA system (q=5).
- Sub-estimate the impulse response of the MA system (q=3).
- Sup-estimate the impulse response of the MA system (q=8).
- Estimate the MA-q system output, using the convolution between the input and the estimated impulse responses from above.
- Compute the NRMSE between the original signal and the outputs produced via Giannakis' formula impulse response estimation and convolution with the input and comment upon the findings.

## HW 4 - Cepstrum via homomorphic filtering
- Acquire voice samples. Either record or find at least 10 voice samples of a male and female individual making the five vowel sounds – “a”, “e”, “i”, “o”, “u”.
- Compute the cepstrum of each voice signal and discuss any difference qualitatively and quantitatively amongst male and female voices in general and amongst the different vowel sounds.
- Lifter the cepstrum domain signals. Design a window to remove the transfer function dependency. Then, compute the time domain signal of the corresponding windowed result to obtain the deconvolved signal. Comment upon the differnce with the original time domain recorded sample.
- Try to synthesize back the voiced signals.

The picture below illustates the block diagram used for the synthesization.

![image](https://user-images.githubusercontent.com/26204902/132141458-93c56f62-1e01-424a-aa63-42f18b3bf81e.png)






