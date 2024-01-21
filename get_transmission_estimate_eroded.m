function trans_est = get_transmission_estimate_eroded(image, atmosphere, omega, win_size)
[m, n, ~] = size(image);
rep_atmosphere = repmat(reshape(atmosphere, [1, 1, 3]), m, n);
trans_est = get_dark_channel( image ./ rep_atmosphere, win_size);

pad_size = floor(win_size/2);
padded_image = padarray(trans_est, [pad_size pad_size], Inf);
trans_est2 = zeros(m, n); 
for j = 1 : m
    for i = 1 : n
        patch = padded_image(j : j + (win_size-1), i : i + (win_size-1));
        trans_est2(j,i) = max(patch(:));
     end
end


trans_est21=(1-trans_est2);

figure(4)
imshow(trans_est21)
end