-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: sh-cynosdbmysql-grp-3uohx78w.sql.tencentcdb.com    Database: main
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Current Database: `main`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `main` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `main`;

--
-- Table structure for table `Major`
--

DROP TABLE IF EXISTS `Major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Major_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校的专业, 当前版本中所有学校专业名称统一(PS:可能存在Bugs)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Major`
--

LOCK TABLES `Major` WRITE;
/*!40000 ALTER TABLE `Major` DISABLE KEYS */;
/*!40000 ALTER TABLE `Major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `University`
--

DROP TABLE IF EXISTS `University`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `University` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `University_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `University`
--

LOCK TABLES `University` WRITE;
/*!40000 ALTER TABLE `University` DISABLE KEYS */;
/*!40000 ALTER TABLE `University` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `second_name` varchar(64) NOT NULL,
  `account_name` varchar(128) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `phone_num` varchar(11) DEFAULT NULL,
  `email_address` varchar(128) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profile` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_account_name_uindex` (`account_name`),
  UNIQUE KEY `User_email_address_uindex` (`email_address`),
  UNIQUE KEY `User_phone_num_uindex` (`phone_num`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (16,'test_first_name','test_second_name','test@mail','f8cdb04495ded47615258f9dc6a3f4707fd2405434fefc3cbf4ef4e6','123411231','test@mail','2020-12-02 10:05:17','2020-12-02 10:05:17',NULL),(17,'First','Second','abc@123.com','f8cdb04495ded47615258f9dc6a3f4707fd2405434fefc3cbf4ef4e6','12345678901','abc@123.com','2020-12-02 10:16:12','2020-12-02 10:16:12',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `post`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `post` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `post`;

--
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doi` varchar(128) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `title` tinytext NOT NULL,
  `venue` varchar(256) DEFAULT NULL,
  `summary` mediumtext,
  `content` mediumblob,
  `publish_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Article_doi_uindex` (`doi`),
  UNIQUE KEY `Article_url_uindex` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES (24,'https://doi.org/10.1002/adma.202002202','https://onlinelibrary.wiley.com/doi/full/10.1002/adma.202002202?saml_referrer','Historical Analysis of High‐Efficiency, Large‐Area Solar Cells: Toward Upscaling of Perovskite Solar Cells','Advanced Materials','The status and problems of upscaling research on perovskite solar cells, which must be addressed for commercialization efforts to be successful, are investigated. An 804 cm2 perovskite solar module has been reported with 17.9% efficiency, which is significantly lower than the champion perovskite solar cell efficiency of 25.2% reported for a 0.09 cm2 aperture area. For the realization of upscaling high‐quality perovskite solar cells, the upscaling and development history of conventional silicon, copper indium gallium sulfur/selenide and CdTe solar cells, which are already commercialized with modules of sizes up to ≈25 000 cm2, are reviewed. GaAs, organic, dye‐sensitized solar cells and perovskite/silicon tandem solar cells are also reviewed. The similarities of the operating mechanisms between the various solar cells and the origin of different development pathway are investigated, and the ideal upscaling direction of perovskite solar cells is subsequently proposed. It is believed that lessons learned from the historical analysis of various solar cells provide a fundamental diagnosis of relative and absolute development status of perovskite solar cells. The unique perspective proposed here can pave the way toward the upscaling of perovskite solar cells.',NULL,'2020-10-09'),(25,'https://doi.org/10.1002/adma.202002741','https://onlinelibrary.wiley.com/doi/full/10.1002/adma.202002741','Solid‐State Electrolyte Design for Lithium Dendrite Suppression','Advanced Materials','All‐solid‐state Li metal batteries have attracted extensive attention due to their high safety and high energy density. However, Li dendrite growth in solid‐state electrolytes (SSEs) still hinders their application. Current efforts mainly aim to reduce the interfacial resistance, neglecting the intrinsic dendrite‐suppression capability of SSEs. Herein, the mechanism for the formation of Li dendrites is investigated, and Li‐dendrite‐free SSE criteria are reported. To achieve a high dendrite‐suppression capability, SSEs should be thermodynamically stable with a high interface energy against Li, and they should have a low electronic conductivity and a high ionic conductivity. A cold‐pressed Li3N–LiF composite is used to validate the Li‐dendrite‐free design criteria, where the highly ionic conductive Li3N reduces the Li plating/stripping overpotential, and LiF with high interface energy suppresses dendrites by enhancing the nucleation energy and suppressing the Li penetration into the SSEs. The Li3N–LiF layer coating on Li3PS4 SSE achieves a record‐high critical current of >6 mA cm−2 even at a high capacity of 6.0 mAh cm−2. The Coulombic efficiency also reaches a record 99% in 150 cycles. The Li3N–LiF/Li3PS4 SSE enables LiCoO2 cathodes to achieve 101.6 mAh g−1 for 50 cycles. The design principle opens a new opportunity to develop high‐energy all‐solid‐state Li metal batteries.',NULL,'2020-10-09'),(26,'https://doi.org/10.1002/adma.202003484','https://onlinelibrary.wiley.com/doi/full/10.1002/adma.202003484','Dual‐Metal Interbonding as the Chemical Facilitator for Single‐Atom Dispersions','Advanced Materials','Atomically dispersed catalysts, with maximized atom utilization of expensive metal components and relatively stable ligand structures, offer high reactivity and selectivity. However, the formation of atomic‐scale metals without aggregation remains a formidable challenge due to thermodynamic stabilization driving forces. Here, a top‐down process is presented that starts from iron nanoparticles, using dual‐metal interbonds (Rh-Fe bonding) as a chemical facilitator to spontaneously convert Fe nanoparticles to single atoms at low temperatures. The presence of Rh-Fe bonding between adjacent Fe and Rh single atoms contributes to the thermodynamic stability, which facilitates the stripping of a single Fe atom from the Fe nanoparticles, leading to the stabilized single atom. The dual single‐atom Rh–Fe catalyst renders excellent electrocatalytic performance for the hydrogen evolution reaction in an acidic electrolyte. This discovery of dual‐metal interbonding as a chemical facilitator paves a novel route for atomic dispersion of chemical metals and the design of efficient catalysts at the atomic scale.',NULL,'2020-10-08'),(27,'https://doi.org/10.1002/adma.202003911','https://onlinelibrary.wiley.com/doi/10.1002/adma.202003911','Organic Long‐Persistent Luminescence from a Thermally Activated Delayed Fluorescence Compound','Advanced Materials','Organic long‐persistent luminescence (OLPL) is one of the most promising methods for long‐lived‐emission applications. However, present room‐temperature OLPL emitters are mainly based on a bimolecular exciplex system which usually needs an expensive small molecule such as 2,8‐bis(diphenyl‐phosphoryl)dibenzo[b,d]thiophene (PPT) as the acceptor. In this study, a new thermally activated delayed fluorescence (TADF) compound, 3‐(4‐(9H‐carbazol‐9‐yl)phenyl)acenaphtho[1,2‐b]pyrazine‐8,9‐dicarbonitrile (CzPhAP), is designed, which also shows OLPL in many well‐known hosts such as PPT, 2,2′,2″‐(1,3,5‐benzinetriyl)‐tris(1‐phenyl‐1‐H‐benzimidazole) (TPBi), and poly(methyl methacrylate) (PMMA), without any exciplex formation, and its OLPL duration reaches more than 1 h at room temperature. Combining the low cost of PMMA manufacture and flexible designs of TADF molecules, pure organic, large‐scale, color tunable, and low‐cost room‐temperature OLPL applications become possible. Moreover, it is found that the onset of the 77 K afterglow spectra from a TADF‐emitter‐doped film is not necessarily reliable for determining the lowest triplet state energy level. This is because in some TADF‐emitter‐doped films, optical excitation can generate charges (electron and holes) that can later recombine to form singlet excitons during the phosphorescence spectrum measurement. The spectrum taken in the phosphorescence time window at low temperature may consequently consist of both singlet and triplet emission.',NULL,'2020-10-07'),(28,'https://doi.org/10.1002/adma.202003826','https://onlinelibrary.wiley.com/doi/10.1002/adma.202003826','Scalable Functionalization of Optical Fibers Using Atomically Thin Semiconductors','Advanced Materials','Atomically thin transition metal dichalcogenides are highly promising for integrated optoelectronic and photonic systems due to their exciton‐driven linear and nonlinear interactions with light. Integrating them into optical fibers yields novel opportunities in optical communication, remote sensing, and all‐fiber optoelectronics. However, the scalable and reproducible deposition of high‐quality monolayers on optical fibers is a challenge. Here, the chemical vapor deposition of monolayer MoS2 and WS2 crystals on the core of microstructured exposed‐core optical fibers and their interaction with the fibers’ guided modes are reported. Two distinct application possibilities of 2D‐functionalized waveguides to exemplify their potential are demonstrated. First, the excitonic 2D material photoluminescence is simultaneously excited and collected with the fiber modes, opening a novel route to remote sensing. Then it is shown that third‐harmonic generation is modified by the highly localized nonlinear polarization of the monolayers, yielding a new avenue to tailor nonlinear optical processes in fibers. It is anticipated that the results may lead to significant advances in optical‐fiber‐based technologies.',NULL,'2020-10-06'),(29,'https://doi.org/10.1002/adma.202003592','https://onlinelibrary.wiley.com/doi/10.1002/adma.202003592','Mass‐Producible, Quasi‐Zero‐Strain, Lattice‐Water‐Rich Inorganic Open‐Frameworks for Ultrafast‐Charging and Long‐Cycling Zinc‐Ion Batteries','Advanced Materials','Low‐cost and high‐safety aqueous Zn‐ion batteries are an exceptionally compelling technology for grid‐scale energy storage. However, their development has been plagued by the lack of stable cathode materials allowing fast Zn2+‐ion insertion and scalable synthesis. Here, a lattice‐water‐rich, inorganic‐open‐framework (IOF) phosphovanadate cathode, which is mass‐producible and delivers high capacity (228 mAh g−1) and energy density (193.8 Wh kg−1 or 513 Wh L−1), is reported. The abundant lattice waters functioning as a “charge shield” enable a low Zn2+‐migration energy barrier, (0.66 eV) even close to that of Li+ within LiFePO4. This fast intrinsic ion‐diffusion kinetics, together with nanostructure effect, allow the achievements of ultrafast charging (71% state of charge in 1.9 min) and an ultrahigh power density (7200 W kg−1 at 107 Wh kg−1). Equally important, the IOF exhibits a quasi‐zero‐strain feature (<1% lattice change upon (de)zincation), which ensures ultrahigh cycling durability (3000 cycles) and Coulombic efficiencies of 100%. The cell‐level energy and power densities reach ≈90 Wh kg−1 and ≈3320 W kg−1, far surpassing commercial lead–acid, Ni–Cd, and Ni–MH batteries. Lattice‐water‐rich IOFs may open up new opportunities for exploring stable and fast‐charging Zn‐ion batteries.',NULL,'2020-10-05'),(30,'https://doi.org/10.1002/adma.202002853','https://onlinelibrary.wiley.com/doi/10.1002/adma.202002853','Continuous Synthesis of Hollow High‐Entropy Nanoparticles for Energy and Catalysis Applications','Advanced Materials','Mixing multimetallic elements in hollow‐structured nanoparticles is a promising strategy for the synthesis of highly efficient and cost‐effective catalysts. However, the synthesis of multimetallic hollow nanoparticles is limited to two or three elements due to the difficulties in morphology control under the harsh alloying conditions. Herein, the rapid and continuous synthesis of hollow high‐entropy‐alloy (HEA) nanoparticles using a continuous “droplet‐to‐particle” method is reported. The formation of these hollow HEA nanoparticles is enabled through the decomposition of a gas‐blowing agent in which a large amount of gas is produced in situ to “puff” the droplet during heating, followed by decomposition of the metal salt precursors and nucleation/growth of multimetallic particles. The high active sites per mass ratio of such hollow HEA nanoparticles makes them promising candidates for energy and electrocatalysis applications. As a proof‐of‐concept, it is demonstrated that these materials can be applied as the cathode catalyst for Li–O2 battery operations with a record‐high current density per catalyst mass loading of 2000 mA gcat.−1, as well as good stability and durable catalytic activity. This work offers a viable strategy for the continuous manufacturing of hollow HEA nanomaterials that can find broad applications in energy and catalysis.',NULL,'2020-10-05'),(31,'https://doi.org/10.1002/adma.202002217','https://onlinelibrary.wiley.com/doi/10.1002/adma.202002217','Progress in Materials, Solution Processes, and Long‐Term Stability for Large‐Area Organic Photovoltaics','Advanced Materials','Organic solar cells based on bulk heterojunctions (BHJs) are attractive energy‐conversion devices that can generate electricity from absorbed sunlight by dissociating excitons and collecting charge carriers. Recent breakthroughs attained by development of nonfullerene acceptors result in significant enhancement in power conversion efficiency (PCEs) exceeding 17%. However, most of researches have focused on pursuing high efficiency of small‐area (<1 cm2) unit cells fabricated usually with spin coating. For practical application of organic photovoltaics (OPVs) from lab‐scale unit cells to industrial products, it is essential to develop efficient technologies that can extend active area of devices with minimized loss of performance and ensured operational stability. In this progress report, an overview of recent advancements in materials and processing technologies is provided for transitioning from small‐area laboratory‐scale devices to large‐area industrial scale modules. First, development of materials that satisfy requirements of high tolerability in active layer thickness and large‐area adaptability is introduced. Second, morphology control using various coating techniques in a large active area is discussed. Third, the recent research progress is also underlined for understanding mechanisms of OPV degradation and studies for improving device long‐term stability along with reliable evaluation procedures.',NULL,'2020-10-05'),(32,'https://doi.org/10.1002/adma.202004835','https://onlinelibrary.wiley.com/doi/10.1002/adma.202004835','Realizing Few‐Layer Iodinene for High‐Rate Sodium‐Ion Batteries','Advanced Materials','Elemental 2D materials with fascinating characteristics are regarded as an influential portion of the 2D family. Iodine is as a typical monoelemental molecular crystal and exhibits great prospects of applications. To realize 2D iodine, not only is it required to separate the weak interlayer van der Waals interactions, but also to reserve the weak intramolecular halogen bonds; thus, 2D iodine is still unexploited until now. Herein, atomically thin iodine nanosheets (termed “iodinene”) with the thickness around 1.0 nm and lateral sizes up to hundreds of nanometers are successfully fabricated by a liquid‐phase exfoliation strategy. When used for the cathode of rechargeable sodium‐ion batteries, the ultrathin iodinene exhibits superb rate properties with a high specific capacity of 109.5 mA h g−1 at the high rate of 10 A g−1 owing to its unique 2D ultrathin architecture with remarkably enhanced pseudocapacitive behavior. First‐principles calculations reveal that the diffusion of sodium ions in few‐layered iodinene changes from the original horizontal direction in bulk to the vertical with a small energy barrier of 0.07 eV because of the size effect. The successful preparation and intensive structural investigation of iodinene paves the way for the development of novel iodine‐based science and technologies.',NULL,'2020-10-01'),(33,'https://doi.org/10.1002/adma.202003983','https://onlinelibrary.wiley.com/doi/10.1002/adma.202003983','Dopant‐Driven Positive Reinforcement in Ex‐Solution Process: New Strategy to Develop Highly Capable and Durable Catalytic Materials','Advanced Materials','The ex‐solution phenomenon, a central platform for growing metal nanoparticles on the surface of host oxides in real time with high durability and a fine distribution, has recently been applied to various scientific and industrial fields, such as catalysis, sensing, and renewable energy. However, the high‐temperature processing required for ex‐solutions (>700 °C) limits the applicable material compositions and has hindered advances in this technique. Here, an unprecedented approach is reported for low‐temperature particle ex‐solution on important nanoscale binary oxides. WO3 with a nanosheet structure is selected as the parent oxide, and Ir serves as the active metal species that produces the ex‐solved metallic particles. Importantly, Ir doping facilitates a phase transition in the WO3 bulk lattice, which further promotes Ir ex‐solution at the oxide surface and eventually enables the formation of Ir particles (<3 nm) at temperatures as low as 300 °C. Low‐temperature ex‐solution effectively inhibits the agglomeration of WO3 sheets while maintaining well‐dispersed ex‐solved particles. Furthermore, the Ir‐decorated WO3 sheets show excellent durability and H2S selectivity when used as sensing materials, suggesting that this is a generalizable synthetic strategy for preparing highly robust heterogeneous catalysts for a variety of applications.',NULL,'2020-10-01'),(34,'https://doi.org/10.1002/adma.202003805','https://onlinelibrary.wiley.com/doi/10.1002/adma.202003805','Direct Optical Patterning of Quantum Dot Light‐Emitting Diodes via In Situ Ligand Exchange','Advanced Materials','Precise patterning of quantum dot (QD) layers is an important prerequisite for fabricating QD light‐emitting diode (QLED) displays and other optoelectronic devices. However, conventional patterning methods cannot simultaneously meet the stringent requirements of resolution, throughput, and uniformity of the pattern profile while maintaining a high photoluminescence quantum yield (PLQY) of the patterned QD layers. Here, a specially designed nanocrystal ink is introduced, “photopatternable emissive nanocrystals” (PENs), which satisfies these requirements. Photoacid generators in the PEN inks allow photoresist‐free, high‐resolution optical patterning of QDs through photochemical reactions and in situ ligand exchange in QD films. Various fluorescence and electroluminescence patterns with a feature size down to ≈1.5 µm are demonstrated using red, green, and blue PEN inks. The patterned QD films maintain ≈75% of original PLQY and the electroluminescence characteristics of the patterned QLEDs are comparable to thopse of non‐patterned control devices. The patterning mechanism is elucidated by in‐depth investigation of the photochemical transformations of the photoacid generators and changes in the optical properties of the QDs at each patterning step. This advanced patterning method provides a new way for additive manufacturing of integrated optoelectronic devices using colloidal QDs.',NULL,'2020-10-01'),(35,'https://doi.org/10.1002/adma.202002121','https://onlinelibrary.wiley.com/doi/10.1002/adma.202002121','Energy Manipulation in Lanthanide‐Doped Core–Shell Nanoparticles for Tunable Dual‐Mode Luminescence toward Advanced Anti‐Counterfeiting','Advanced Materials','Developing advanced luminescent materials and techniques is of significant importance for anti‐counterfeiting applications, and remains a huge challenge. In this work, a new and efficient approach for achieving efficient dual‐mode luminescence with tunable color outputs via Gd3+‐mediated interfacial energy transfer, Ce3+‐assisted cross‐relaxation, and core–shell nanostructuring strategy is reported. The introduction of Ce3+ into the inner core not only serves the regulation of upconversion emission, but also facilitates the ultraviolet photon harvesting and subsequent energy transfer to downshifting (DS) activators in the outer shell layer. Furthermore, the construction of the core@shell nanoarchitecture enables the spatial separation of upconverting activators and DS centers, which greatly suppresses their adverse cross‐relaxation processes. Consequently, efficient and multicolor‐tunable dual‐mode emissions can be simultaneously observed in the pre‐designed NaGdF4:Yb/Ho/Ce@NaYF4:X (X = Eu, Tb, Sm, Dy) core–shell nanostructures under 254 nm ultraviolet light and 980 nm laser excitation. The proof‐of‐concept experiment demonstrates that 2D‐encoded patterns based on dual‐mode emitting nanomaterials are very promising for anti‐counterfeiting applications. It is believed that this preliminary study will advance the development of the fluorescent materials for potential applications in anti‐counterfeiting and optical multiplexing.',NULL,'2020-10-01'),(36,'https://doi.org/10.1002/adma.202003830','https://onlinelibrary.wiley.com/doi/10.1002/adma.202003830','Solid‐State Thin‐Film Broadband Short‐Wave Infrared Light Emitters','Advanced Materials','Solid‐state broadband light emitters in the visible have revolutionized today\'s lighting technology achieving compact footprints, flexible form factors, long lifetimes, and high energy saving, although their counterparts in the infrared are still in the development phase. To date, broadband emitters in the infrared have relied on phosphor‐downconverted light emitters based on atomic optical transitions in transition metal or rare earth elements in the phosphor layer resulting in limited spectral bandwidths in the near‐infrared and preventing their integration into electrically driven light‐emitting diodes (LEDs). Herein, phosphor‐converted LEDs based on engineered stacks of multi‐bandgap colloidal quantum dots (CQDs) are reported as a novel class of broadband emitters covering a broad short‐wave infrared (SWIR) spectrum from 1050–1650 nm with a full‐width‐half‐maximum of 400 nm, delivering 14 mW of optical power with a quantum efficiency of 5.4% and power conversion efficiency of 13%. Leveraging the electrical conductivity of the CQD stacks, further, the first broadband SWIR‐active LED is demonstrated, paving the way toward complementary metal–oxide–semiconductor integrated broadband emitters for on‐chip spectrometers and low‐cost volume manufacturing. SWIR spectroscopy is employed to illustrate the practical relevance of the emitters in food and material identification case studies.',NULL,'2020-09-30'),(37,'https://doi.org/10.1002/adma.202002736','https://onlinelibrary.wiley.com/doi/10.1002/adma.202002736','Metal Halide Perovskite Nanorods: Shape Matters','Advanced Materials','Quasi‐1D metal halide perovskite nanorods (NRs) are emerging as a type of materials with remarkable optical and electronic properties. Research into this field is rapidly expanding and growing in the past several years, with significant advances in both mechanistic studies of their growth and widespread possible applications. Here, the recent advances in 1D metal halide perovskite nanocrystals (NCs) are reviewed, with a particular emphasis on NRs. At first, the crystal structures of perovskites are elaborated, which is followed by a review of the major synthetic approaches toward perovskite NRs, such as wet‐chemical synthesis, substrate‐assisted growth, and anion exchange reactions, and discussion of the growth mechanisms associated with each synthetic method. Then, thermal and aqueous stability and the linear polarized luminescence of perovskite NRs are considered, followed by highlighting their applications in solar cells, light‐emitting diodes, photodetectors/phototransistors, and lasers. Finally, challenges and future opportunities in this rapidly developing research area are summarized.',NULL,'2020-09-28'),(38,'https://doi.org/10.1002/adma.202002210','https://onlinelibrary.wiley.com/doi/10.1002/adma.202002210','Synergetic Structural Transformation of Pt Electrocatalyst into Advanced 3D Architectures for Hydrogen Fuel Cells','Advanced Materials','A new direction for developing electrocatalysts for hydrogen fuel cell systems has emerged, based on the fabrication of 3D architectures. These new architectures include extended Pt surface building blocks, the strategic use of void spaces, and deliberate network connectivity along with tortuosity, as design components. Various strategies for synthesis now enable the functional and structural engineering of these electrocatalysts with appropriate electronic, ionic, and electrochemical features. The new architectures provide efficient mass transport and large electrochemically active areas. To date, although there are few examples of fully functioning hydrogen fuel cell devices, these 3D electrocatalysts have the potential to achieve optimal cell performance and durability, exceeding conventional Pt powder (i.e., Pt/C) electrocatalysts. This progress report highlights the various 3D architectures proposed for Pt electrocatalysts, advances made in the fabrication of these structures, and the remaining technical challenges. Attempts to develop design rules for 3D architectures and modeling, provide insights into their achievable and potential performance. Perspectives on future developments of new multiscale designs are also discussed along with future study directions.',NULL,'2020-09-28'),(39,'https://doi.org/10.1002/adma.202002014','https://onlinelibrary.wiley.com/doi/10.1002/adma.202002014','Broad‐Spectral‐Range Sustainability and Controllable Excitation of Hyperbolic Phonon Polaritons in α‐MoO3','Advanced Materials','Hyperbolic phonon polaritons (HPhPs) in orthorhombic‐phase molybdenum trioxide (α‐MoO3) show in‐plane hyperbolicity, great wavelength compression, and ultralong lifetime, therefore holding great potential in nanophotonic applications. However, its polaritonic response in the far‐infrared (FIR) range remains unexplored due to challenges in experimental characterization. Here, monochromated electron energy loss spectroscopy (EELS) in a scanning transmission electron microscope (STEM) is used to probe HPhPs in α‐MoO3 in both mid‐infrared (MIR) and FIR frequencies and correlate their behaviors with microstructures and orientations. It is found that low structural symmetry leads to various phonon modes and multiple Reststrahlen bands (RBs) over a broad spectral range (over 70 meV) and in different directions (55–63 meV and 119–125 meV along the b‐axis, 68–106 meV along the c‐axis, and 101–121 meV along the a‐axis). These HPhPs can be selectively excited by controlling the direction of swift electrons. These findings provide new opportunities in nanophotonic and optoelectronic applications, such as directed light propagation, hyperlenses, and heat transfer.',NULL,'2020-09-27'),(40,'https://doi.org/10.1002/adma.202005037','https://onlinelibrary.wiley.com/doi/10.1002/adma.202005037','Air‐Stable Low‐Symmetry Narrow‐Bandgap 2D Sulfide Niobium for Polarization Photodetection','Advanced Materials','Low‐symmetry 2D materials with unique anisotropic optical and optoelectronic characteristics have attracted a lot of interest in fundamental research and manufacturing of novel optoelectronic devices. Exploring new and low‐symmetry narrow‐bandgap 2D materials will be rewarding for the development of nanoelectronics and nano‐optoelectronics. Herein, sulfide niobium (NbS3), a novel transition metal trichalcogenide semiconductor with low‐symmetry structure, is introduced into a narrowband 2D material with strong anisotropic physical properties both experimentally and theoretically. The indirect bandgap of NbS3 with highly anisotropic band structures slowly decreases from 0.42 eV (monolayer) to 0.26 eV (bulk). Moreover, NbS3 Schottky photodetectors have excellent photoelectric performance, which enables fast photoresponse (11.6 µs), low specific noise current (4.6 × 10−25 A2 Hz−1), photoelectrical dichroic ratio (1.84) and high‐quality reflective polarization imaging (637 nm and 830 nm). A room‐temperature specific detectivity exceeding 107 Jones can be obtained at the wavelength of 3 µm. These excellent unique characteristics will make low‐symmetry narrow‐bandgap 2D materials become highly competitive candidates for future anisotropic optical investigations and mid‐infrared optoelectronic applications.',NULL,'2020-09-27'),(41,'https://doi.org/10.1002/adma.202001866','https://onlinelibrary.wiley.com/doi/10.1002/adma.202001866','Recent Progress in Engineering the Atomic and Electronic Structure of Electrocatalysts via Cation Exchange Reactions','Advanced Materials','In the past few decades, tremendous advances have been made in electrocatalysis due to the rational design of electrocatalysts at the nanoscale level. Further development requires engineering electrocatalysts at the atomic level, which is a grand challenge. Here, the recent advances in cation exchange strategy, which is a powerful tool for fine‐tuning atomic structure of electrocatalysts via surface faceting, heteroatom doping, defects formation, and strain modulation, are the main focus. Proper atomic structure engineering effectively adjusts the electronic structure, and thus enhances the electronic conductivity and facilitates the adsorption/desorption of reaction intermediates. By virtue, the cation exchange strategy greatly boosts the intrinsic and apparent activities of electrocatalysts and shows a great potential toward design of new energy conversion devices, such as water splitting devices and metal–air batteries. It is believed that cation exchange offers new insights and opportunities for the rational design of a new generation of electrocatalysts.',NULL,'2020-09-27'),(42,'https://doi.org/10.1002/adma.202002193','https://onlinelibrary.wiley.com/doi/10.1002/adma.202002193','Advances in the Design of 3D‐Structured Electrode Materials for Lithium–Metal Anodes','Advanced Materials','Although the lithium–metal anode (LMA) can deliver a high theoretical capacity of ≈3860 mAh g−1 at a low redox potential of −3.040 V (vs the standard hydrogen electrode), its application in rechargeable batteries is hindered by the poor Coulombic efficiency and safety issues caused by dendritic metal growth. Consequently, careful electrode design, electrolyte engineering, solid–electrolyte interface control, protective layer introduction, and other strategies are suggested as possible solutions. In particular, one should note the great potential of 3D‐structured electrode materials, which feature high active specific surface areas and stereoscopic structures with multitudinous lithiophilic sites and can therefore facilitate rapid Li‐ion flux and metal nucleation as well as mitigate Li dendrite formation through the kinetic control of metal deposition even at high local current densities. This progress report reviews the design of 3D‐structured electrode materials for LMA according to their categories, namely 1) metal‐based materials, 2) carbon‐based materials, and 3) their hybrids, and allows the results obtained under different experimental conditions to be seen at a single glance, thus being helpful for researchers working in related fields.',NULL,'2020-09-24'),(43,'https://doi.org/10.1002/adma.202004798','https://onlinelibrary.wiley.com/doi/10.1002/adma.202004798','A Self‐Healing Amalgam Interface in Metal Batteries','Advanced Materials','Poor cyclability and safety concerns caused by the uncontrollable dendrite growth and large interfacial resistance severely restrict the practical applications of metal batteries. Herein, a facile, universal strategy to fabricate ceramic and glass phase compatible, and self‐healing metal anodes is proposed. Various amalgam‐metal anodes (Li, Na, Zn, Al, and Mg) show a long cycle life in symmetric cells. It has been found that liquid Li amalgam shows a complete wetting with the surface of lanthanum lithium titanate electrolyte and a glass‐phase solid‐state electrolyte. The interfacial compatibility between the lithium metal anode and solid‐state electrolyte is dramatically improved by using an in situ regenerated amalgam interface with high electron/ion dual‐conductivity, obviously decreasing the anode/electrolyte interfacial impedance. The lithium‐amalgam interface between the metal anode and electrolyte undergoes a reversible isothermal phase transition between solid and liquid during the cycling process at room temperature, resulting in a self‐healing surface of metal anodes.',NULL,'2020-09-23'),(44,'https://doi.org/10.1002/adma.202002213','https://onlinelibrary.wiley.com/doi/10.1002/adma.202002213','Organic Semiconductor–DNA Hybrid Assemblies','Advanced Materials','Organic semiconductors are photonic and electronic materials with high luminescence, quantum efficiency, color tunability, and size‐dependent optoelectronic properties. The self‐assembly of organic molecules enables the establishment of a fabrication technique for organic micro‐ and nano‐architectures with well‐defined shapes, tunable sizes, and defect‐free structures. DNAs, a class of biomacromolecules, have recently been used as an engineering material capable of intricate nanoscale structuring while simultaneously storing biological genetic information. Here, the up‐to‐date research on hybrid materials made from organic semiconductors and DNAs is presented. The trends in photonic and electronic phenomena discovered in DNA‐functionalized and DNA‐driven organic semiconductor hybrids, comprising small molecules and polymers, are observed. Various hybrid forms of solutions, arrayed chips, nanowires, and crystalline particles are discussed, focusing on the role of DNA in the hybrids. Furthermore, the recent technical advances achieved in the integration of DNAs in light‐emitting devices, transistors, waveguides, sensors, and biological assays are presented. DNAs not only serve as a recognizing element in organic‐semiconductor‐based sensors, but also as an active charge‐control material in high‐performance optoelectronic devices.',NULL,'2020-10-09');
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Author_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (35,'Andrey L. Rogach'),(15,'Andrey Turchanin'),(40,'Antony George'),(31,'Bong-Joong Kim'),(20,'Chuan-Fu Sun'),(4,'Chunsheng Wang'),(24,'Dmitri V. Talapin'),(8,'Dong June Ahn'),(41,'Donghwan Kim'),(9,'Eil Zysman-Colman'),(12,'Falk Eilenberger'),(30,'Gerasimos Konstantatos'),(33,'Guohua Jia'),(14,'Hae Jung Son'),(1,'Hae-Seok Lee'),(2,'Haibo Zeng'),(18,'Hua Wang'),(28,'Ifor D. W. Samuel'),(13,'IL-Doo Kim'),(16,'Jeong Woo Han'),(22,'Jiacheng Wang'),(25,'Jianjun Liu'),(10,'Jin Young Kim'),(6,'Li-min Liu'),(21,'Liangbing Hu'),(38,'Lin Guo'),(39,'Man Luo'),(37,'Peng Gao'),(26,'Peng Zhou'),(19,'Shi-Zhang Qiao'),(17,'Tao Ling'),(5,'Tao Tao'),(29,'Weida Hu'),(23,'WooChul Jung'),(7,'Xiaofei Yang'),(36,'Xiulin Fan'),(32,'Xuyong Yang'),(11,'Ying(Ian) Chen'),(27,'Young Soo Yun'),(3,'Zhen Wang'),(34,'Zheng Liu');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Institution`
--

DROP TABLE IF EXISTS `Institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Institution_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Institution`
--

LOCK TABLES `Institution` WRITE;
/*!40000 ALTER TABLE `Institution` DISABLE KEYS */;
INSERT INTO `Institution` VALUES (25,'Beihang University'),(27,'Chinese Academy of Sciences'),(24,'City University of Hong Kong'),(14,'Curtin University'),(9,'Deakin University'),(7,'Dongguan South China Design Innovation Institute'),(22,'Friedrich Schiller University'),(1,'Fudan University'),(3,'Illinois Institute of Technology'),(23,'Kent State University'),(12,'Korea Advanced Institute of Science and Technology'),(4,'Korea Institute of Energy Technology Evaluation and Planning'),(21,'Korea Institute of Science and Technology'),(19,'Korea University'),(26,'Nanjing Forestry University'),(6,'Peking University'),(8,'Pohang University of Science and Technology'),(13,'Shanghai Institute of CeramicsChinese Academy of Sciences'),(18,'Shanghai University'),(2,'The Barcelona Institute of Science and Technology'),(17,'The University of Adelaide'),(15,'Tianjin University'),(16,'University of Chicago'),(20,'University of Chinese Academy of Sciences'),(5,'University of Maryland'),(11,'University of St Andrews'),(10,'Zhejiang University');
/*!40000 ALTER TABLE `Institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MajorLabel`
--

DROP TABLE IF EXISTS `MajorLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MajorLabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Category_name_uindex` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MajorLabel`
--

LOCK TABLES `MajorLabel` WRITE;
/*!40000 ALTER TABLE `MajorLabel` DISABLE KEYS */;
INSERT INTO `MajorLabel` VALUES (3,'Biomaterials'),(7,'Condensed Matter Physics'),(5,'Materials for Devices'),(1,'Materials for Energy & Catalysis'),(2,'Optics & Photonics'),(4,'Soft Materials'),(6,'Structural Materials');
/*!40000 ALTER TABLE `MajorLabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relation_Article_Author`
--

DROP TABLE IF EXISTS `Relation_Article_Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relation_Article_Author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Author_Author_id_fk` (`author_id`),
  KEY `Relation_Article_Author_Article_id_fk` (`article_id`),
  CONSTRAINT `Author_Author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `Author` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Relation_Article_Author_Article_id_fk` FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relation_Article_Author`
--

LOCK TABLES `Relation_Article_Author` WRITE;
/*!40000 ALTER TABLE `Relation_Article_Author` DISABLE KEYS */;
INSERT INTO `Relation_Article_Author` VALUES (1,24,41),(2,24,1),(3,25,36),(4,25,4),(5,26,34),(6,26,25),(7,26,22),(8,27,9),(9,27,28),(10,28,40),(11,28,15),(12,28,12),(13,29,20),(14,30,21),(15,31,14),(16,32,18),(17,32,6),(18,32,38),(19,33,31),(20,33,16),(21,33,23),(22,33,13),(23,34,24),(24,35,7),(25,35,2),(26,36,30),(27,37,32),(28,37,35),(29,37,33),(30,38,10),(31,39,37),(32,40,3),(33,40,39),(34,40,26),(35,40,29),(36,41,17),(37,41,19),(38,42,27),(39,43,5),(40,43,11),(41,44,8);
/*!40000 ALTER TABLE `Relation_Article_Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relation_Article_Institution`
--

DROP TABLE IF EXISTS `Relation_Article_Institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relation_Article_Institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ArticleID` int(11) NOT NULL,
  `InstitutionID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Institution_Institution_id_fk` (`InstitutionID`),
  KEY `Institution_Article_id_fk` (`ArticleID`),
  CONSTRAINT `Institution_Article_id_fk` FOREIGN KEY (`ArticleID`) REFERENCES `Article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Institution_Institution_id_fk` FOREIGN KEY (`InstitutionID`) REFERENCES `Institution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relation_Article_Institution`
--

LOCK TABLES `Relation_Article_Institution` WRITE;
/*!40000 ALTER TABLE `Relation_Article_Institution` DISABLE KEYS */;
INSERT INTO `Relation_Article_Institution` VALUES (1,24,4),(2,25,5),(3,25,10),(4,26,20),(5,26,3),(6,26,13),(7,27,11),(8,28,22),(9,29,20),(10,30,5),(11,31,19),(12,32,25),(13,33,12),(14,33,8),(15,34,16),(16,35,26),(17,36,2),(18,37,18),(19,37,24),(20,37,14),(21,38,21),(22,39,6),(23,40,1),(24,40,27),(25,40,20),(26,41,15),(27,41,17),(28,41,23),(29,42,19),(30,43,7),(31,43,9),(32,44,19);
/*!40000 ALTER TABLE `Relation_Article_Institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relation_Article_MajorLabel`
--

DROP TABLE IF EXISTS `Relation_Article_MajorLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relation_Article_MajorLabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章外键, 设置链接删除, 当主表Row删除时此表对应Rows将被删除',
  `category_id` int(11) NOT NULL COMMENT '分类外键, 设置链接删除, 当主表Row删除时此表对应Rows将被删除',
  PRIMARY KEY (`id`),
  KEY `Classification_Article_id_fk` (`article_id`),
  KEY `Classification_Category_id_fk` (`category_id`),
  CONSTRAINT `Classification_Category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `MajorLabel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='文章和类别之间存在的分类关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relation_Article_MajorLabel`
--

LOCK TABLES `Relation_Article_MajorLabel` WRITE;
/*!40000 ALTER TABLE `Relation_Article_MajorLabel` DISABLE KEYS */;
INSERT INTO `Relation_Article_MajorLabel` VALUES (1,24,1),(2,25,1),(3,26,1),(4,27,2),(5,28,2),(6,29,1),(7,30,1),(8,31,1),(9,32,1),(10,33,1),(11,34,2),(12,35,2),(13,36,2),(14,37,2),(15,38,1),(16,39,2),(17,40,2),(18,41,1),(19,42,1),(20,43,1),(21,44,3);
/*!40000 ALTER TABLE `Relation_Article_MajorLabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relation_Article_Sub_Label`
--

DROP TABLE IF EXISTS `Relation_Article_Sub_Label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relation_Article_Sub_Label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL COMMENT '文章外键, 设置链接删除, 当主表Row删除时此表对应Rows将被删除',
  `category_id` int(11) NOT NULL COMMENT '分类外键, 设置链接删除, 当主表Row删除时此表对应Rows将被删除',
  PRIMARY KEY (`id`),
  KEY `Classification_Article_id_fk` (`post_id`),
  KEY `Classification_Category_id_fk` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='文章和类别之间存在的分类关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relation_Article_Sub_Label`
--

LOCK TABLES `Relation_Article_Sub_Label` WRITE;
/*!40000 ALTER TABLE `Relation_Article_Sub_Label` DISABLE KEYS */;
INSERT INTO `Relation_Article_Sub_Label` VALUES (1,24,36),(2,24,19),(3,25,14),(4,25,32),(5,25,2),(6,26,5),(7,26,12),(8,26,29),(9,26,21),(10,27,34),(11,27,16),(12,27,33),(13,27,22),(14,28,17),(15,28,30),(16,28,41),(17,29,14),(18,29,39),(19,29,26),(20,30,9),(21,30,20),(22,31,36),(23,31,23),(24,32,14),(25,32,18),(26,33,5),(27,33,35),(28,33,1),(29,33,40),(30,34,34),(31,34,25),(32,34,7),(33,34,38),(34,35,34),(35,35,16),(36,35,8),(37,36,34),(38,36,25),(39,36,7),(40,36,38),(41,37,34),(42,37,16),(43,37,19),(44,37,4),(45,38,5),(46,38,10),(47,38,29),(48,38,42),(49,39,27),(50,39,3),(51,39,24),(52,39,13),(53,40,17),(54,40,31),(55,40,15),(56,41,5),(57,41,28),(58,41,42),(59,42,14),(60,42,32),(61,43,14),(62,43,2),(63,43,32),(64,44,37),(65,44,6),(66,44,11);
/*!40000 ALTER TABLE `Relation_Article_Sub_Label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relation_Author_Institution`
--

DROP TABLE IF EXISTS `Relation_Author_Institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relation_Author_Institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Relation_AuthorInstitution_Author_id_fk` (`author_id`),
  KEY `Relation_AuthorInstitution_Institution_id_fk` (`institution_id`),
  CONSTRAINT `Relation_AuthorInstitution_Author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `Author` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Relation_AuthorInstitution_Institution_id_fk` FOREIGN KEY (`institution_id`) REFERENCES `Institution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relation_Author_Institution`
--

LOCK TABLES `Relation_Author_Institution` WRITE;
/*!40000 ALTER TABLE `Relation_Author_Institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `Relation_Author_Institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubLabel`
--

DROP TABLE IF EXISTS `SubLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubLabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SubLabel_name_uindex` (`label`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubLabel`
--

LOCK TABLES `SubLabel` WRITE;
/*!40000 ALTER TABLE `SubLabel` DISABLE KEYS */;
INSERT INTO `SubLabel` VALUES (14,'Batteries'),(35,'CO2/CO Reduction'),(11,'DNA'),(5,'Electrocatalysis'),(10,'Fuel cells'),(40,'Graphene'),(20,'High Entropy Alloys'),(12,'Hydrogen Evolution Reaction'),(26,'Inorganic Open Framework'),(8,'Lanthanide'),(34,'Lasers,LEDs and light sources'),(25,'Light-emitting diodes LEDs'),(32,'Lithium metal batteries'),(9,'Lithium-O2 batteries'),(16,'Luminescence'),(28,'Metal Air Battery'),(4,'Metal Halides'),(27,'Nanophotonics and Plasmonics'),(29,'Nobel metals'),(21,'Non precious metal'),(22,'Nonlinear Optics'),(30,'Optical Fibers'),(17,'Optoelectronics'),(6,'Organic'),(33,'Organic Materials'),(23,'Organic Solar Cells/Photovoltaic Cells'),(42,'Oxygfen reduction reaction ORR'),(19,'Perovskite'),(3,'Phonon-polariton excitations'),(31,'Photodetector'),(13,'Photonic Crystals'),(7,'Quantum Dots'),(38,'Semiconductor material'),(37,'Semiconductors'),(18,'Sodium ion batteries'),(36,'Solar cells'),(2,'Solid state batteries/Solid Electrolyte'),(24,'Transition Metal Oxides'),(41,'Transitional Metal Dichalcogenide'),(15,'Transitional Metal Trichalcoginides'),(1,'Trnasition Metal Oxides/Mixed metal oxides'),(39,'Zinc ion batteries');
/*!40000 ALTER TABLE `SubLabel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08 17:21:09
