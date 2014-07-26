function  PLOTH( H, A )

hold on
for i=1:size(H,1)
  for j=1:size(H,2);
    plot(A(j), H(i,j),'*');
  end
end
hold off

end

