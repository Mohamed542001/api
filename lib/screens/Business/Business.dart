part of 'BusinessImports.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          fallback:(context)=>const Center(child: CircularProgressIndicator()),
          builder: (context)=>ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            separatorBuilder: (context,i)=>const Divider(thickness: 2),
            itemBuilder: (context,i)=> BuildBusinessItem(article:list[i]),
          ),
        );
      },
    );
  }
}
