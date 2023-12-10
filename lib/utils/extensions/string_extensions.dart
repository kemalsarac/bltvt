import 'extensions.dart';

extension StringExtensions on String {
  String left(int endIndex) {
    if (length <= endIndex) {
      return this;
    } else {
      return substring(0, endIndex);
    }
  }

  String right(int startIndex) {
    if (length <= startIndex) {
      return this;
    } else {
      return substring(startIndex);
    }
  }

  removeTurkishChar() {
    String str = this;

    str = str.replaceAll(RegExp(r'Ç'), "C");
    str = str.replaceAll(RegExp(r'Ğ'), "G");
    str = str.replaceAll(RegExp(r'İ'), "I");
    str = str.replaceAll(RegExp(r'Ö'), "O");
    str = str.replaceAll(RegExp(r'Ş'), "S");
    str = str.replaceAll(RegExp(r'Ü'), "U");
    str = str.replaceAll(RegExp(r'ç'), "c");
    str = str.replaceAll(RegExp(r'ğ'), "g");
    str = str.replaceAll(RegExp(r'ı'), "i");
    str = str.replaceAll(RegExp(r'ö'), "o");
    str = str.replaceAll(RegExp(r'ş'), "s");
    str = str.replaceAll(RegExp(r'ü'), "u");

    return str;
  }

// Sayıyı yazıya çevirme (Kuruşlu ve sınırsız basamaklı, Örneğin: binyüzseksen TL onbeş Kuruş,
// ayrıca istediğiniz yabancı dile entegre edebilirsiniz.)
// Örnek kullanım şekli : numberToText cevir = new numberToText();
// String yaziyla= cevir.numberToText(125478.254, 2, "TL", "Kuruş", "#", null, null, null);

  String numberToText({
    int kurusbasamak = 2,
    String parabirimi = "TL",
    String parakurus = "Kr",
    String diyez = ".",
  }) {
// kurusbasamak virgülden sonra gösterilecek basamak sayısı
// bb1, bb2, bb3 ise sayıların değişik dillerde yazılması için list
// parabirimi = TL gibi , parakurus = Kuruş gibi
// diyez başa ve sona kapatma işareti atar # gibi
    String sayi = toString();
    List<String> b1 = ["", "bir", "iki", "üç", "dört", "beş", "altı", "yedi", "sekiz", "dokuz"];
    List<String> b2 = ["", "on", "yirmi", "otuz", "kırk", "elli", "altmış", "yetmiş", "seksen", "doksan"];
    List<String> b3 = ["", "yüz", "bin", "milyon", "milyar", "trilyon", "katrilyon"];

    String say1, say2 = ""; // say1 virgül öncesi, say2 kuruş bölümü
    String sonuc = "";

    sayi = sayi.replaceAll(",", "."); //virgül noktaya çevrilir

    if (sayi.indexOf(".") > 0) {
      // nokta varsa (kuruş)

      say1 = sayi.substring(0, sayi.indexOf(".")); // virgül öncesi
      say2 = sayi.substring(sayi.indexOf("."), sayi.length); // virgül sonrası, kuruş
    } else {
      say1 = sayi; // kuruş yok
    }

    List<String> rk = [];
    rk.insertAdd(say1); // rakamlara ayırma

    String son;
    int w = 1; // işlenen basamak
    int sonaekle = 0; // binler on binler yüzbinler vs. için sona bin (milyon,trilyon...) eklenecek mi?
    int kac = rk.length; // kaç rakam var?
    int sonint; // işlenen basamağın rakamsal değeri
    int uclubasamak = 0; // hangi basamakta (birler onlar yüzler gibi)
    int artan = 0; // binler milyonlar milyarlar gibi artışları yapar
    String gecici;

    if (kac > 0) {
      // virgül öncesinde rakam var mı?

      for (int i = 0; i < kac; i++) {
        son = (rk[kac - 1 - i]); // son karakterden başlayarak çözümleme yapılır.
        sonint = int.parse(son); // işlenen rakam

        if (w == 1) {
          // birinci basamak bulunuyor

          sonuc = b1[sonint] + sonuc;
        } else if (w == 2) {
          // ikinci basamak

          sonuc = b2[sonint] + sonuc;
        } else if (w == 3) {
          // 3. basamak

          if (sonint == 1) {
            sonuc = b3[1] + sonuc;
          } else if (sonint > 1) {
            sonuc = b1[sonint] + b3[1] + sonuc;
          }
          uclubasamak++;
        }

        if (w > 3) {
          // 3. basamaktan sonraki işlemler

          if (uclubasamak == 1) {
            if (sonint > 0) {
              sonuc = b1[sonint] + b3[2 + artan] + sonuc;
              if (artan == 0) {
                // birbin yazmasını engelle
                if (kac - 1 == i) {
                  // 11000 yazılışını düzeltme
                  sonuc = sonuc.replaceAll(b1[1] + b3[2], b3[2]);
                }
              }
              sonaekle = 1; // sona bin eklendi
            } else {
              sonaekle = 0;
            }
            uclubasamak++;
          } else if (uclubasamak == 2) {
            if (sonint > 0) {
              if (sonaekle > 0) {
                sonuc = b2[sonint] + sonuc;
                sonaekle++;
              } else {
                sonuc = b2[sonint] + b3[2 + artan] + sonuc;
                sonaekle++;
              }
            }
            uclubasamak++;
          } else if (uclubasamak == 3) {
            if (sonint > 0) {
              if (sonint == 1) {
                gecici = b3[1];
              } else {
                gecici = b1[sonint] + b3[1];
              }
              if (sonaekle == 0) {
                gecici = gecici + b3[2 + artan];
              }
              sonuc = gecici + sonuc;
            }
            uclubasamak = 1;
            artan++;
          }
        }

        w++; // işlenen basamak
      }
    } // if(kac>0)

    if ("" == sonuc) {
      // virgül öncesi sayı yoksa para birimi yazma
      parabirimi = "";
    }

    say2 = say2.replaceAll(".", "");
    String kurus = "";

    if ("" != say2) {
      // kuruş hanesi varsa

      if (kurusbasamak > 3) {
        // 3 basamakla sınırlı
        kurusbasamak = 3;
      }
      if (say2.length > kurusbasamak) {
        // belirlenen basamak kadar rakam yazılır
        say2 = say2.substring(0, kurusbasamak);
      }

      List<String> kurusrk = [];
      kurusrk.insertAdd(say2); // rakamlara ayırma

      kac = kurusrk.length; // kaç rakam var?
      w = 1;

      for (int i = 0; i < kac; i++) {
        // kuruş hesabı

        son = kurusrk[kac - 1 - i]; // son karakterden başlayarak çözümleme yapılır.
        sonint = int.parse(son); // işlenen rakam

        if (w == 1) {
          // birinci basamak

          if (kurusbasamak > 0) {
            kurus = b1[sonint] + kurus;
          }
        } else if (w == 2) {
          // ikinci basamak
          if (kurusbasamak > 1) {
            kurus = b2[sonint] + kurus;
          }
        } else if (w == 3) {
          // 3. basamak
          if (kurusbasamak > 2) {
            if (sonint == 1) {
              // 'biryüz' ü engeller
              kurus = b3[1] + kurus;
            } else if (sonint > 1) {
              kurus = b1[sonint] + b3[1] + kurus;
            }
          }
        }
        w++;
      }
      if ("" == kurus) {
        // virgül öncesi sayı yoksa para birimi yazma
        parakurus = "";
      } else {
        kurus = ",$kurus";
      }
      kurus = kurus + parakurus; // kuruş hanesine 'kuruş' kelimesi ekler
    }

    sonuc = sonuc + parabirimi + kurus + diyez;

    return sonuc;
  }

  String repeat(int repeatCount) {
    return List.generate(repeatCount, (int index) => this).join('');
  }
}
