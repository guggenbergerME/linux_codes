# SSL

+ https://forum.osticket.com/d/103920-cannot-error-fsockopen-unable-to-connect-to-unknown-error-errno-0

```
Seems you did not call the constructor from the laminas-mail protocoltrait class on line 318 in include/class.mail.php which is necessary to set the novalidatecert to true. So we add this call including "true" as the last parameter for the novalidatecert to fix it. All that was necessary is to add this line:
parent::__construct($connect['host'], $connect['port'], $connect['ssl'], true);

Here is how it looks then inside include/class.mail.php file:

    // MailBoxProtocolTrait
    use Laminas\Mail\Protocol\Imap as ImapProtocol;
    use Laminas\Mail\Protocol\Pop3 as Pop3Protocol;
    trait MailBoxProtocolTrait {
        final public function init(AccountSetting $setting) {
            // Attempt to connect to the mail server
            $connect = $setting->getConnectionConfig();
            // Let's go Brandon
            parent::__construct($connect['host'], $connect['port'], $connect['ssl'], true);
            parent::connect($connect['host'], $connect['port'],
                    $connect['ssl']);
            // Attempt authentication based on MailBoxAccount settings
            $auth = $setting->getAuthCredentials();

Another fix as mentioned by someone else is to add the base64 encoded certificate of the mail / exchange server or the certificate of your CA to the local certificate store. To do this (for debian linux) place the cert under /usr/local/share/ca-certificates/ and name it e.g. mailserver.crt. Make sure to use .crt file extension. Then update the cert store by sudo update-ca-certificates. Output looks like this then:

Updating certificates in /etc/ssl/certs...
1 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
```
