# Gästebuch

| Erweiterung | Name |
| ------ | ------ |
| HTML/CSS Framework | [Bootstrap](https://getbootstrap.com) |
| Cache-Class | [phpFastCache](https://www.phpfastcache.com/) |
| Template-Engine | [Twig](https://twig.symfony.com/) |

### Installation
Vorraussetzung: 
- PHP Version 7.0

### Installation
1. /inc/config.php öffnen und anpassen (Selbsterklärend)
2. MySQL Tabellen einfügen

### MySQL Tabellen

```sh
CREATE TABLE `guestbook` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) NOT NULL,
  `message` text NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1;
```

```sh
CREATE TABLE `account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1;
```
