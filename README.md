# Postfix Kuyruk Takibi (PRTG Sensörü)

Bu betik, Postfix e-posta kuyruğunu izlemek ve PRTG Network Monitor üzerinden izleme sağlamak için kullanılabilir.

## İçerik
- **postfixq.sh**: Postfix kuyruk uzunluğunu hesaplayan ve sonucu PRTG ile uyumlu formatta döndüren betik.
- **Kurulum Adımları**
- **PRTG Yapılandırması**
- **Test Etme**
- **Sorun Giderme**

## Kurulum
1. Sunucunuzda **Postfix** ve **bash** kurulu olduğundan emin olun.
2. Aşağıdaki betiği **/var/prtg/scripts/** dizinine kaydedin:

```sh
#!/bin/sh

PSLIST=$(/usr/sbin/postqueue -p | grep -c '^[A-Z0-9]')

if [ -z "$PSLIST" ]; then
    PSLIST=0
fi

echo "0:$PSLIST:$PSLIST Adet"
```

3. Betiğe çalıştırmaya  izni verin:
   ```sh
   chmod +x /var/prtg/scripts/postfixq.sh
   ```

## PRTG Yapılandırması
1. PRTG Web Arayüzüne gidin.
2. **Yeni Sensör Ekle** seçeneğini kullanarak **SSH Script** sensörünü ekleyin.
3. **Script Dosyası** olarak `postfixq.sh` seçin.
4. **Parametreler** boş bırakılabilir.
5. **Sensörü Kaydet** ve **Test Et** yaparak çalışıp çalışmadığını kontrol edin.

## Test Etme
Manuel olarak betiği çalıştırıp doğruluğunu kontrol edebilirsiniz:
```sh
/var/prtg/scripts/postfixq.sh
```

Eğer bir hata alırsanız **Sorun Giderme** kısmına bakabilirsiniz.

## Sorun Giderme
- **Eğer çıktıda boşluk veya format hatası alıyorsanız:**
  - `echo` komutunun gereksiz boşluk veya yeni satır ekleyip eklemediğini kontrol edin.
- **Eğer sensör PRTG tarafından algılanmıyorsa:**
  - Betiği manuel olarak  manuel olarak çalıştırın ve doğru sonucu döndürdüğünü kontrol edin.
  - PRTG'nin bağlandığı kullanıcının betiğe erişim izni olup olmadığını kontrol edin.

## Teşekkürler
