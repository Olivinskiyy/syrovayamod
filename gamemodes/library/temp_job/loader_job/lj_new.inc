#define MAX_CHECKPOINT_LOAD 4

#define D_TEMP_JOB_LOADER_START 9010
#define D_TEMP_JOB_LOADER_END 9011

enum T_LOAD_LOADER_JOB_STRUCT // временные работы
{
	Float: TC_POS_X,
	Float: TC_POS_Y,
	Float: TC_POS_Z,
};

new t_load_loader_job[MAX_CHECKPOINT_LOAD][T_LOAD_LOADER_JOB_STRUCT] =
{
	{2544.8366, -2058.7077,22.1714},
	{2544.3559, -2046.65425, 22.1714},
	{2539.0124, -2046.2210, 22.1872},
	{2539.1745, -2058.4692, 22.1870}
};

new const Float: loader_job_unload_cp[1][3] = // позиции загрузки (грузчик)
{
	{2562.8444,-2064.018554,21.960937}
};