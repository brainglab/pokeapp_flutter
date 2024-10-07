import 'package:pokeapp_flutter/domain/entities/generation_i.dart';
import 'package:pokeapp_flutter/domain/entities/generation_ii.dart';
import 'package:pokeapp_flutter/domain/entities/generation_iii.dart';
import 'package:pokeapp_flutter/domain/entities/generation_iv.dart';
import 'package:pokeapp_flutter/domain/entities/generation_v.dart';
import 'package:pokeapp_flutter/domain/entities/generation_vii.dart';
import 'package:pokeapp_flutter/domain/entities/generation_viii.dart';
import 'package:pokeapp_flutter/domain/entities/home.dart';

class Versions {
  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, Home>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });
}
