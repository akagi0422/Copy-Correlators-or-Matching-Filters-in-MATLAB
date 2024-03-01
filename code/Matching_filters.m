LFM = ; % 参考信号
signal_in = ; % 输入信号

N_signal_in = length(signal_in); % 输入信号长度
N_LFM = length(LFM); % 参考信号长度

flip_signal = fliplr(signal); % 本地信号翻转
flip_st = conj(flip_st); % 翻转后取共轭
zero_fill_flip_st = [zeros(1,N_signal_in - N_LFM) flip_st]; % 对翻转、取共轭的本地信号补零

s_zero_fill_flip_st = fft(zero_fill_flip_st);
s_d = fft(d);

S = s_d.* s_zero_fill_flip_st; % 频域乘积
IFFT_S = ifft(S); % 相关函数
