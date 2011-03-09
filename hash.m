% hash(s,largeprime) returns an integer hash value between 1 and largeprime
% for character string s. (Note: this is not a good hash function for
% cryptographic purposes.  Search MATLAB "hash" for something better.)

function h = hash(s,largeodd)
   fac = 256;
   h = 0;
   for i=1:length(s)
     h = rem(h*fac+double(s(i)),largeodd);
   end
   h=h+1;
end
