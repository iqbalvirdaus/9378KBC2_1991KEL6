/*====================================================================================
           SISTEM PAKAR TENTANG DIAGNOSA PENYAKIT UNGGAS AYAM
				KELOMPOK 6
		             KECERDASAN BUATAN
=====================================================================================*/




domains
            kerusakan = symbol
            gejala = symbol
            tanya = string
            jawab = char
            kondisi = list*
            list = string
FACTS
	    xcari(gejala)
            xgagal(gejala)
            nama(kondisi)
            false(list)
            %tanya(tanya,gejala,jawab)
            
predicates
nondeterm   mulai
nondeterm   lihat(kondisi)
            cari(tanya,gejala)
            gagal(tanya,gejala)
  nondeterm gejala(gejala)
            clear_fakta2
            simpan(gejala,jawab)
            tanya(tanya,gejala,jawab)
            gojek
  nondeterm diagnosa(kerusakan)
            solusi(kerusakan)
            penanganan(kerusakan)
  nondeterm ini(char)
  nondeterm awal
  lacak(char,char)
       

clauses
lacak(Jawab,Jawab):-!.
lacak(_,_):-fail.
	   
	    nama(["1.Fahrul Yamani 1315015124", "2.Iqbal Virdaus 1515015149", "3.Syamsudin Hadi 1515015189"]).
	awal:-
	    write("================================SELAMAT DATANG DI KLINIK==============================="),nl,
	    write("==============================PEMERIKSAAN PENYAKIT AYAM============================"),nl,nl,
	    write("Nama Kelompok : "),nl,
	     nama(Kelompok),
	     lihat(Kelompok),nl,
	     write("SILAHKAN ISI DIAGNOSA DIBAWAH DENGAN KONDISI Y (benar) & T (untuk tidak) :)"),nl,nl.
		
            mulai:-
                        gojek,nl,nl,nl,nl,nl,
                        write("Apakah Ingin mengulang lagi (Y/T) ?"),nl,
                        readchar(Jawab),ini(Jawab).
                        
            ini(Jawab):-lacak(Jawab,'y'),mulai.
              
                                     
             lihat ([H|T]):-
	    	   not(false(H)),
	    	   write(H),nl,
	    	   lihat(T).
	    	   
	    lihat([H|_]):-
	    	 assertz(false(H)).
            gojek:-
                        diagnosa(_),!,write(""),
                        save("test.txt"),
                        clear_fakta2.
            gojek:-
                        write("MAAF SAYA TIDAK MENEMUKAN PENYAKIT YANG ADA PADA AYAM ANDA"),nl,
                        clear_fakta2.
            cari(_,Gejala):-write("Apakah "),
                        xcari(Gejala),!.
            cari(Tanya,Gejala):-write("Ayam "),
                        not(xgagal(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='y'.
            gagal(_,Gejala):-
                        xgagal(Gejala),!.
            gagal(Tanya,Gejala):-
                        not(xcari(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='t'.
            tanya(Tanya,Gejala,Jawab):-
                        write(Tanya),
                        readchar(Jawab),
                        write(Jawab),nl,
                        simpan(Gejala,Jawab).
            simpan(Gejala,'y'):-
                        asserta(xcari(Gejala)).
            simpan(Gejala,'t'):-
                        asserta(xgagal(Gejala)).
            clear_fakta2:-
                        retract(xcari(_)),fail.
            clear_fakta2:-
                        retract(xgagal(_)),fail.
            clear_fakta2.
/*```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````*/
/*===================================================================G E J A L A=====================================================================*/
/*```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````*/
            gejala(Gejala):-
                        xcari(Gejala),!.
            gejala(Gejala):-
                        xgagal(Gejala),!,fail.

            gejala(gumboro):-
            		write("======================================"),nl,
            		write("Pertanyaan Penyakit Gumboro"),nl,
            		write("======================================"),nl,
                        cari(" Nafsu Makan Berkurang(y/t)? ",gumboro),
                        cari(" Tampak Lesu(y/t)? ",gumboro1),
                        cari(" Duduk Dengan Sikap(y/t)? ",gumboro2),
                        cari(" Membungkuk(y/t)? ",gumboro3).
            gejala(mareks):-
            		write("======================================"),nl,
            		write("Pertanyaan Penyakit Mareks"),nl,
            		write("======================================"),nl,
                        cari(" Nafas Cepat (y/t)? ",mareks),
                        cari(" Mulai Pucat (y/t)? ",mareks1),
                        cari(" Sempoyongan (y/t)? ",mareks2),
                        cari(" Kaki Pincang (y/t)? ",mareks3),
                        cari(" Sayap Manggantung (y/t)? ",mareks4).
             gejala(produksi_telur):-
             		write("======================================"),nl,
            		write("Pertanyaan Penyakit Produksi Telur"),nl,
            		write("======================================"),nl,
                        cari(" Nafas Cepat(y/t)? ",produksi_telur),
                        cari(" Produksi Telur Menurun(y/t)? ",produksi_telur1),
                        cari(" Kualitas Telur Jelek(y/t)? ",produksi_telur2).    
	     gejala(flu_burung):-
	     		write("======================================"),nl,
            		write("Pertanyaan Penyakit Flu Burung"),nl,
            		write("======================================"),nl,
                        cari(" Nafas Cepat (y/t)? ",flu_burung),
                        cari(" Jengger dan Pial Berwarna Kemerahan Sampai Kebiruan (y/t)? ",flu_burung1),
             		cari(" Produksi Telur Menurun (y/t)? ",flu_burung2),
            		cari(" Diare (y/t)? ",flu_burung3),
            		cari(" Kelumpuhan (y/t)? ",flu_burung4),
            		cari(" Bercak darah pada kaki (y/t)? ",flu_burung5),
            		cari(" Menyebabkan Kematian (y/t)? ",flu_burung6),
            		cari(" Kematian Mendadak (y/t)? ",flu_burung7),
            		cari(" Angka Kematian Yang Tinggi (y/t)? ",flu_burung8).
             gejala(saluran_pernapasan):-
             		write("======================================"),nl,
            		write("Pertanyaan Penyakit Saluran Pernapasan"),nl,
            		write("======================================"),nl,
                        cari(" Nafas Cepat(y/t)? ",saluran_pernapasan),
                        cari(" Produksi Telur Menurun (y/t)? ",saluran_pernapasan1),
                        cari(" Menyebabkan Kematian (y/t)? ",saluran_pernapasan2),
                        cari(" Angka Kematian Tinggi (y/t)? ",saluran_pernapasan3),
                        cari(" Diare Berwarna hijau (y/t)? ",saluran_pernapasan4),
                        cari(" Kelemahan/malas bergerak (y/t)? ",saluran_pernapasan5),
                        cari(" Kehilangan Nafsu Makan(y/t)? ",saluran_pernapasan6),
                     	cari(" Kehilangan Nafsu Minum(y/t)? ",saluran_pernapasan7).
                     	
             gejala(cacar_unggas):-
             		write("======================================"),nl,
            		write("Pertanyaan Penyakit Cacar Unggas"),nl,
            		write("======================================"),nl,
                        cari(" Nafas Cepat(y/t)? ",cacar_unggas),
                        cari(" Muncul lesi di daerah yang tidak ditumbuhi bulu(y/t)? ",cacar_unggas1),
                        cari(" Pembengkakan dari sinus dan mata(y/t)? ",cacar_unggas2).
/* -----------------------------------------------------------D I A G N O S A-------------------------------------------------------- */

           
            diagnosa("Penyakit_Gumboro"):-
                        gejala(gumboro),
                        solusi("Penyakit Gumboro"),
            		penanganan("Dapat dicoba pengobatan vitamin-elektrolit yang rupa-rupanya sedikit menolong ayam-ayam yang sakit.").
                        
            diagnosa("Penyakit_Mareks"):-
                        gejala(mareks),
                        solusi("Penyakit Mareks"),
            penanganan("Ayam yang sakit disingkirkan untuk disembelih dan Sebaiknya sejak kecil, ayam di vaksin Marek.").
            
            diagnosa("Produksi_Telur"):-
                        gejala(produksi_telur),
                        solusi("Penyakit Produksi Telur"),
            		penanganan("pemberian multivitamin untuk meninkatkan daya tahan tubuh serta antibiotik broad spectrum untuk mencegah infeksi sekunder.").
	    diagnosa("Penyakit flu Burung"):-
                        gejala(flu_burung),
                        solusi("Penyakit Flu Burung"),
            penanganan("1.Pemusnahan unggas atau burung yang terinfeksi flu burung \n\t\t 2. Vaksinasi Pada Unggas Yang Sehat.").
            diagnosa("Penyakit Saluran Pernapasan"):-
                        gejala(saluran_pernapasan),
                    	solusi("Penyakit Saluran Pernapasan"),
            penanganan("Injeksi ANTIBIOTIK ERITHROSIM DAN TILOSIN dengan cara :\n\t\t 1. injeksi \n 2.air minum / pakan.").
            diagnosa("Penyakit Cacar Unggas"):-
                        gejala(cacar_unggas),
                        solusi("Penyakit cacar unggas"),
            penanganan("1.Peningkatan nafsu makan dengan cara pemberian vitamin \n\t\t 2. pemberian antibiotik pada infeksi sekunder .").
/*==================================================================================================================================*/           
            
            solusi(Kerusakan):-
                        upper_lower(XKerusakan,Kerusakan),nl,nl,
                        write("  # Gejala yang ada pada ayam anda adalah = ",XKerusakan),nl.  

            penanganan(Kerusakan):-
                        upper_lower(BKerusakan,Kerusakan),nl,nl,
                        write("  # Solusinya adalah = ",BKerusakan),nl.  
goal
	 awal,
	 mulai.