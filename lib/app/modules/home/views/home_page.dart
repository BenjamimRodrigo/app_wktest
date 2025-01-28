import 'package:app_wktest/app/data/models/pessoa_model.dart';
import 'package:app_wktest/app/modules/home/controllers/home_controller.dart';
import 'package:app_wktest/app/modules/indicadores/bindings/indicadores_binding.dart';
import 'package:app_wktest/app/modules/indicadores/views/indicadores_page.dart';
import 'package:app_wktest/app/themes/colors_palete.dart';
import 'package:app_wktest/app/themes/icons_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Base de doadores',
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.insert_chart_outlined_outlined,
              color: SECONDARY_COLOR,
              size: 30,
            ),
            onPressed: () => Get.to(() => IndicadoresPage(), binding: IndicadoresBinding()),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 10),
            Hero(
              tag: PESSOA_ICON,
              child: Image.asset(PESSOA_ICON, height: 60),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: controller.textController,
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
                textAlignVertical: TextAlignVertical.center,
                focusNode: controller.focusSearch,
                decoration: InputDecoration(
                  hintText: "Pesquise aqui...",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Obx(
                    () => controller.isFocused
                        ? InkWell(
                            child: Icon(Icons.close, color: SECONDARY_COLOR),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              controller.textController.clear();
                              controller.pesquisar();
                            },
                          )
                        : SizedBox(),
                  ),
                ),
                onChanged: (value) {
                  controller.isLoading = true;
                  controller.debouncer
                      .run(() => controller.pesquisar(pesquisa: value));
                },
              ),
            ),
            Obx(() {
              if (controller.isFocused) {
                return SizedBox();
              } else {
                return AnimationConfiguration.staggeredList(
                  position: 0,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                  ),
                );
              }
            }),
            Obx(() {
              if (!controller.isLoading) {
                if (controller.totalElements > 1) {
                  return Text("${controller.totalElements} pessoas encontradas",
                      style: TextStyle(
                          color: PRIMARY_COLOR, fontFamily: 'Nunito'));
                } else if (controller.totalElements == 1) {
                  return Text("Só uma pessoa encontrada",
                      style: TextStyle(
                          color: PRIMARY_COLOR, fontFamily: 'Nunito'));
                }
                return Text("Nenhuma pessoa encontrada",
                    style:
                        TextStyle(color: PRIMARY_COLOR, fontFamily: 'Nunito'));
              }
              return SizedBox();
            }),
            Flexible(
              child: GetX<HomeController>(
                init: controller,
                initState: (_) {},
                builder: (_) {
                  if (controller.errorAtSeach.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Text("Ops! Tente novamente! ${controller.errorAtSeach}"),
                    );
                  }
                  if (controller.isLoading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: SECONDARY_COLOR),
                        Text("Aguarde...")
                      ],
                    );
                  }
                  if (controller.pessoas.isEmpty &&
                      controller.textController.text.isEmpty) {
                    return Center(
                      child: ElevatedButton(
                        onPressed: () => controller.enviarDadosLocais(),
                        child: Text(
                          "Enviar dados locais",
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(10),
                    itemCount: controller.pessoas.length + 1,
                    itemBuilder: (_, index) {
                      if (controller.pessoas.length == index) {
                        return Obx(() {
                          if (controller.loadMore) {
                            return Center(
                              child: ElevatedButton(
                                onPressed: controller.isLoadingMore
                                    ? null
                                    : () => controller.pesquisar(
                                        pesquisa:
                                            controller.textController.text,
                                        page: ++controller.currentPage),
                                child: controller.isLoadingMore
                                    ? SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                            color: SECONDARY_COLOR))
                                    : Text(
                                        "Carregar mais",
                                        style: TextStyle(
                                            color: SECONDARY_COLOR,
                                            fontSize: 16),
                                      ),
                              ),
                            );
                          }
                          return Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Não tem mais 😁")));
                        });
                      }
                      final Pessoa pessoa = controller.pessoas[index];
                      return _itemBuild(pessoa, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemBuild(Pessoa pessoa, int index) {
    return AnimationConfiguration.staggeredList(
      position: index,
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/images/avatar_doador.png'),
            backgroundColor: Colors.transparent,
          ),
          title: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              pessoa.nome!,
              style: TextStyle(
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          subtitle: Row(
            children: [
              Icon(Icons.bloodtype, size: 14, color: SECONDARY_COLOR),
              Text(
                pessoa.atributosFisicos!.tipoSanguineo!,
                style: TextStyle(
                    fontSize: 16, color: SECONDARY_COLOR, fontFamily: 'Nunito'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
