# Correction-Network-GUI-with-MATLAB
display step response and Bode diagram of second-order linear system and generate its correction network to meet users’ requirements in MATLAB GUI
Run 'main.m' first and click the button to begin.
'G(s)' means the open-loop transfer function of the origin system, up to second order. 'C(s)'(optional) means the series correction network provided by you. Press 'Step Response' button to check step response and bode diagrame in two windows showed in GUI.
If you want to compare different responses of the system before and after correction, I recommand you to click 'Time Domain Analyze' first, and original properties will be shown in the command line sction, then press 'Add Correction Net.' button to apply your own network, after that you can see two different step response and bode curves shwon in two windows.
To check some dynamic properties such as overshoot and peak time of your system, click 'Time Domain Analyze' and 'TDA(after correction)' to display origin system properties and that after correction respectively.
I also developed a practical option for you, which allows you to generate a series lead correction network satisfying your requirements. After you entered 'Speed Error','cut-off freq' and 'phase margin', click 'Generate correction Net. and verify', new comparations will be shown in two left windows.
After the generation, you could still click the 'TDA(after correction)' to observe dynamic properties of corrected system.
