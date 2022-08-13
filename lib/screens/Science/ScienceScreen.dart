part of 'ScienceImports.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).sciences;
        return ConditionalBuilder(
          condition: list.length>0,
          fallback:(context)=>const Center(child: CircularProgressIndicator()),
          builder: (context)=>ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            separatorBuilder: (context,i)=>const Divider(thickness: 2),
            itemBuilder: (context,i)=> BuildScienceItem(article:list[i]),
          ),
        );
      },
    );
  }
}
