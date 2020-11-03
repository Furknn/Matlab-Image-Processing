%Boyutlar dizilerin sonuna sýfýr eklenerek esitlendi
signal(numel(furkanSesComprs))=0;
keremSesComprs(numel(furkanSesComprs))=0;
toplam=furkanSesComprs+signal+keremSesComprs;
audiowrite('toplam.wav',toplam,m4afs)
audiowrite('toplam_bolu3.wav',toplam,m4afs/3)