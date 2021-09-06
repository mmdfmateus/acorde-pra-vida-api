-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: AcordePraVida
-- ------------------------------------------------------
-- Server version       5.7.35
--
--
-- Command executed:   mysqldump -u root -p AcordePraVida > db-dump.sql

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `artistId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `genre` varchar(256) NOT NULL,
  `photoUrl` varchar(256) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`artistId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Scalene',0,'Rock','https://rollingstone.uol.com.br/media/_versions/scalene_breno_galtier_divulgacao_widelg.jpg',0),(2,'Péricles',0,'Pagode','https://s2.glbimg.com/zr-LkGQYepHQ4Df-t27CYviVDV4=/0x0:1588x1676/3200x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2019/q/z/AaIBsPQLqHGg93dETDjw/pericles2-2019.jpg',0),(3,'Gusttavo Lima',0,'Sertanejo','https://upload.wikimedia.org/wikipedia/commons/5/59/GUSTTAVO_LIMA.jpg',0),(4,'Barões da Pisadinha',5,'Forró','https://www.vagalume.com.br/os-baroes-da-pisadinha/images/os-baroes-da-pisadinha.jpg',5),(5,'Bruno e Marrone',0,'Sertaneijo','https://media.hugogloss.uol.com.br/uploads/2020/10/bruno-e-marrone-raquel-cunha.jpg',0),(6,'João Gomes',0,'Forró','https://uploads.metropoles.com/wp-content/uploads/2021/07/08161116/Joao-Gomes-1.jpg',0),(7,'Bon Jovi',0,'Rock','https://images.impresa.pt/blitz/2020-11-30-jon-bon-jovi.jpg/original/mw-860',0),(8,'Pe Marcelo Rossi',0,'Gospel','https://noticiasdatv.uol.com.br/media/uploads/artigos/padre-marcelo-rossi-saradao-reproducao-instagram.jpg',0);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMINISTRADOR'),(2,'USUARIO');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `songId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `videoUrl` varchar(256) NOT NULL,
  `genre` varchar(256) NOT NULL,
  `userId` int(11) NOT NULL,
  `artistId` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`songId`),
  KEY `fk_created_by_user` (`userId`),
  KEY `fk_has_artist` (`artistId`),
  CONSTRAINT `fk_created_by_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `fk_has_artist` FOREIGN KEY (`artistId`) REFERENCES `artist` (`artistId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (3,'Boate Azul','<p style=\"text-align:start;\">&nbsp;<span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Doente de amor procurei remédio<br>           </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Na vida noturna<br>               </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">F</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Com a flor da noite <br>                           </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Em uma boate aqui na zona sul<br><br>           </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Dm</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>A dor do amor é com outro amor <br>             </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Que a gente cura<br>             </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Vim curar a dor desse mal de amor<br>           </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Na boate azul<br>            </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Dm</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>E quando a noite vai se agonizando<br>                </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>No clarão da aurora<br>      </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Os integrantes da vida noturna<br>             </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Se foram dormir<br>             </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Dm</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>E a dama da noite que estava comigo<br>              </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Também foi embora<br>                </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">F</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Fecharam-se as portas<br>            </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Sozinho de novo<br>          </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Tive que sair</span></p>\n',2,0,'https://www.youtube.com/watch?v=8HVLFySv1yQ','Sertanejo',1,5,0),(4,'Facas','<p style=\"text-align:start;\"><br><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C9</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>   Primeiramente guarde suas armas<br>                               </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Já me machuca tanto as suas palavras<br><br>Eu tô querendo uma conversa civilizada<br> </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C9</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Sei que tá esperando uma crítica<br><br>Mas tô correndo dessa briga<br> </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Hoje não tem vilão<br><br>Hoje não tem vítima<br>                                <br>Não tem plateia, não tem bebida <br></span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C9</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Ouô, uôuôuô<br><br>[Refrão]<br><br>   </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C9</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">                     <br>Você com raiva me atacando<br>
                  </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>E eu só com um beijo dou o troco<br>    </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C9</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Cê sabe que a gente não tem moral<br>                      </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Pra viver longe um do outro<br>              </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Em7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">       <br>Como se duas facas <br>                   </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Bm</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Se riscassem procurando o corte<br>              </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>São dois corações <br>      </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D7(4/9)</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Disputando quem é o mais forte</span></p>\n',2,0,'https://www.youtube.com/watch?v=VntVkQRaAS8','Sertanejo',1,5,0),(5,'Livin\' On A Prayer','<p style=\"text-align:start;\"><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Tommy used to work on the docks<br><br>Union\'s been on strike<br>                           </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C5</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Hes down on his luc, it\'s tough<br>   (Riff Principal)<br>So tough<br><br><br>Gina works the diner all day<br><br>Working for her man<br>                             </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C5</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>She brings home her pay for love<br>    (Riff Principal)<br>For love<br><br>[Primeira Ponte]<br><br>
        </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C5</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>She says: We\'ve got to hold on<br>               </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>To what we\'ve got<br>           </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C5</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>\'Cause it doesn\'t make a difference<br>                  </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>If we make it or not<br>       </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C5</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>We\'ve got each other<br>              </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E5</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>And that\'s a lot for love<br>       </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D5</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>We\'ll give it a sho</span></p>\n',2,0,'https://www.youtube.com/watch?v=lDK9QqIzhwk','Rock',1,7,0),(7,'Melhor Eu Ir','<p style=\"text-align:start;\">&nbsp;<span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E7M(9)</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Melhor eu ir<br>
 </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7M</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"> ( </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G#m7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7M</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"> )<br>Tudo bem vai ser melhor só<br>                   </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E7M(9)</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Se teve que ser assim<br>                                  </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7M</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D7/13</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>É que pensando bem nunca existiu nós<br>        </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7M(9)</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E7M(9)</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Só eu que pensei na gente<br>
    </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7M</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"> ( </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G#m7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7M</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"> ) <br>Ainda que demorei pra terminar, dói<br>              </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C#m7(11)</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">B4</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Não era só comigo que você ficava<br> </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7M</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E/A</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G#m7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">  <br>Foi tão difícil ter que enxergar<br><br>[Segunda Parte]<br><br>                      </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">F#m7(11)</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Que tudo isso foi ilusão<br>                             </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G#m7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Todo esse tempo eu perdi em vão<br>     </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am6</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am6/B</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am6/C</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">A7M</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E6</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>É difícil ter que a_____cei__tar<br>         </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E7M</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E6</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">F#m7(11)</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Meu coração, ele não deixa não<br>                               </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">G#m7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Se faz de bobo, não tem jeito não<br>      </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Db7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">B7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Só a vida pode ex_________plicar</span></p>\n',3,0,'https://www.youtube.com/watch?v=saalFn025fU','Pagode',1,2,0),(8,'Entrelaços','<p style=\"text-align:start;\"><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">[Intro] </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Em</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Em</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Raro encontrar alguém que raramente faz questionar<br></span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Se encontrar alguém na minha idade é fantasiar<br></span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Em</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Tem vezes que parece que ela já viveu tantas versões<br></span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>De histórias de mulheres que criei na mente com adições<br></span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">F</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Gestos e olhares delicados que até fazem enganar<br></span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>O bobo que não vê debaixo disso sua força<br><br></span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Dm7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C7M</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Ó meu bem quero estar ao seu lado<br>        </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Dm7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C7M</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Quando amanhecer quero estar ao seu lado<br>        </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Dm7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">C7M</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Quando florescer o de melhor em nós dois<br>        </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Dm7</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">E7</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"><br>Quero percorrer o seu corpo inteiro<br><br>( </span><span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Am</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">Em</span> <span style=\"color: rgb(255,119,0);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\">D</span><span style=\"color: rgb(33,33,33);font-size: 14px;font-family: Roboto Mono\", \"Courier New\", Courier, monospace;\"> )</span>&nbsp;</p>\n',2,0,'https://www.youtube.com/watch?v=yIzRffbRppw','Rock',1,1,0);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `isEmailConfirmed` tinyint(1) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `authToken` varchar(256) DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `fk_has_role` (`roleId`),
  CONSTRAINT `fk_has_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'mateus@gmail.com','$2b$10$85L/dr2Bi5AZLaJMONf2E.Qbktgs9f.F1zElgWgwkHcL0ahNM2lkC','mateus',NULL,2),(2,1,'mateusm@gmail.com','$2b$10$//oWKgWumDrgbr6IKuibH.WewEZTNbimHtcGZ9XO/2Ub08g2AYw/G','Mateus Mourão','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjMwOTAyNTE5fQ.fRrvQkafLbZ6KwLQQGiFSEXVdLtPQ958q1KV_q3tG-0',2),(3,1,'brant@gmail.com','$2b$10$aZHlTaM3GEo7A3nlurhPE.lKt6xXhnpwkiNG958c8eTCTtmskWGKq','brant','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjMwOTQ5MDI2fQ.mKG_yf16Kssp2Rz5cmeG97l_F69wvuRvh6IYX2nCL94',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06 17:32:30