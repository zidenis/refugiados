import 'moradias.dart';
import 'trabalhos.dart';

final String lore1 =
    "Lorem ipsum dolor sit amet, mea ad corrumpit intellegat, vis cu partem quidam. Officiis consequat has ex. Affert platonem ea vis, sit cu vide iuvaret. Eum suas legendos ea, cu ancillae lucilius pro, labitur vocibus nec ut. Mea eu iuvaret deserunt disputando, eam id reque legimus percipit.";
final String lore2 =
    "Tation voluptatum eu eam, at duo regione omittantur, vis causae bonorum elaboraret ut. Et molestiae interesset sed. Latine convenire ex nec, usu ad facete inimicus. Pri lorem insolens at, eu partem habemus vix. Usu eu debet utroque euripidis. Te per atomorum necessitatibus, nonumy aperiri commune te eam. Consequat voluptatum sit et, quando antiopam qui ut. Veri nemore inermis ad sea, has cu solet officiis imperdiet, eros menandri oportere his te. Pro quod meis falli no. Nec natum clita mediocrem ut.";
final String lore3 =
    "Aeque ponderum an per, oratio periculis liberavisse est in, reque numquam has eu. Utinam alterum repudiandae pri ea. Eos ea nostro instructior. Ad eos animal iisque denique, ignota veritus mel in. Vim id luptatum voluptatum.";
final String lore4 =
    "Sea docendi legendos consetetur cu, aperiri inciderint pri at. His modo laudem ex. Te pri viris aliquid, an pro probo habemus. Ex mel volutpat consetetur definiebas, alii omnis senserit ad mea. Ut usu tempor graeci diceret, enim hinc causae ut vim.";
final String lore5 = "Propriae voluptua indoctum qui eu, id vel autem iriure.";
final String lore6 =
    "Consequat voluptatum sit et, quando antiopam qui ut. Veri nemore inermis ad sea, has cu solet officiis imperdiet, eros menandri oportere his te. Pro quod meis falli no. Nec natum clita mediocrem ut. Sea docendi legendos consetetur cu, aperiri inciderint pri at. His modo laudem ex. Te pri viris aliquid, an pro probo habemus. Ex mel volutpat consetetur definiebas, alii omnis senserit ad mea. Ut usu tempor graeci diceret, enim hinc causae ut vim. Tation voluptatum eu eam, at duo regione omittantur, vis causae bonorum elaboraret ut. Et molestiae interesset sed. Latine convenire ex nec, usu ad facete inimicus. Pri lorem insolens at, eu partem habemus vix. Usu eu debet utroque euripidis. Te per atomorum necessitatibus, nonumy aperiri commune te eam. Consequat voluptatum sit et, quando antiopam qui ut. Veri nemore inermis ad sea, has cu solet officiis imperdiet, eros menandri oportere his te. Pro quod meis falli no. Nec natum clita mediocrem ut.";

final List<Trabalho> trabalhos_sample = <Trabalho>[
  new Trabalho("Contrata-se Garçom", "Boa Vista-RR", new DateTime(2018, 6, 1), 1, lore1),
  new Trabalho("Vaga de Zelador", "São Paulo-RJ", new DateTime(2018, 6, 10), 2, lore2),
  new Trabalho("Professor de Espanhol", "Boa Vista-RR", new DateTime(2018, 7, 1), 4, lore4),
  new Trabalho("Ajudante de Cozinha", "Boa Vista-RR", new DateTime(2018, 7, 1), 1, lore5),
  new Trabalho("Trabalho Temporário", "João Pessoa-PB", new DateTime(2018, 7, 2), 2, lore6),
  new Trabalho("Construção", "Manaus-AM", new DateTime(2017, 6, 1), 1, lore1),
  new Trabalho("Vaga de Porteiro", "Rio de Janeiro-RJ", new DateTime(2017, 6, 10), 2, lore2),
  new Trabalho("Motorista", "Boa Vista-RR", new DateTime(2017, 7, 1), 4, lore4),
  new Trabalho("Secretária Bilingue", "Natal-RN", new DateTime(2017, 7, 1), 1, lore5),
  new Trabalho("Vaga em ONG", "Boa Vista-RR", new DateTime(2017, 7, 2), 2, lore6)
];

final List<Moradia> moradias_sample = <Moradia>[
  new Moradia("Apartamento 2 quartos", "Boa Vista-RR", new DateTime(2018, 6, 1), 1, lore1),
  new Moradia("Quarto para casal", "Rio de Janeiro-RJ", new DateTime(2018, 6, 10), 2, lore2),
  new Moradia("Apartamento", "Natal-RN", new DateTime(2018, 6, 12), 3, lore3),
  new Moradia("Casa Simples", "Boa Vista-RR", new DateTime(2018, 7, 1), 4, lore4),
  new Moradia("Apartamento para dois", "Natal-RN", new DateTime(2018, 7, 1), 1, lore5),
  new Moradia("Quarto Disponível", "João Pessoa-PB", new DateTime(2018, 7, 2), 2, lore6),
  new Moradia("Apartamento 2 quartos", "Boa Vista-RR", new DateTime(2017, 6, 1), 1, lore1),
  new Moradia("Quarto para casal", "Rio de Janeiro-RJ", new DateTime(2017, 6, 10), 2, lore2),
  new Moradia("Apartamento", "Natal-RN", new DateTime(2017, 6, 12), 3, lore3),
  new Moradia("Casa Simples", "São Paulo-SP", new DateTime(2017, 7, 1), 4, lore4),
  new Moradia("Apartamento para dois", "Natal-RN", new DateTime(2017, 7, 1), 1, lore5),
  new Moradia("Quarto Disponível", "Boa Vista", new DateTime(2017, 7, 2), 2, lore6)
];