import json
import numpy as np
import matplotlib.pyplot as plt


VIEW_TYPE = 'label'
VIEW_TYPES = [
    'label',
    'image',
    'text_field',
    'button',
]


def obtain_label(view_type):
    if view_type == 'label':
        return 'Комп. отображения текста'
    elif view_type == 'image':
        return 'Комп. отображения изображения'
    elif view_type == 'text_field':
        return 'Комп. поля ввода строки символов'
    elif view_type == 'button':
        return 'Комп. кнопки'

def throttler_ram():
    x = [0, 1, 4, 10, 20, 30, 40, 50, 60, 80, 100]
    y = [0, 11, 24, 30, 43, 50, 87, 108, 116, 137, 148]
    y_buf = [0, 8, 21, 32, 39, 42, 37, 44, 33, 40, 41]
    xticks = range(0, 101, 10) 
    
    x = np.array(x)
    y = np.array(y)
    y_buf = np.array(y_buf)
    plt.plot(x, y, label="Выделение памяти без компонента управления потоком данных")
    plt.plot(x, y_buf, label="Выделение памяти с компонентом управления потоком данных")
    
    plt.xticks(xticks)
    plt.xlabel('Время непрерывного запроса данных (с)')
    plt.ylabel('Количество выделенной оперативной памяти (MB)')

    plt.legend()
    plt.show()

def throttler_time():
    x = [0, 1, 4, 10, 20, 30, 40, 50, 60, 80, 100]
    y = [0, 0.11, 0.2, 0.17, 0.24, 0.37, 0.54, 0.62, 0.83, 0.76, 0.91]
    y_buf = [0, 0.13, 0.19, 0.24, 0.17, 0.34, 0.29, 0.4, 0.33, 0.39, 0.2]
    xticks = range(0, 101, 10) 
    
    x = np.array(x)
    y = np.array(y)
    y_buf = np.array(y_buf)
    plt.plot(x, y, label="Время обработки данных без компонента управления потоком данных")
    plt.plot(x, y_buf, label="Время обработки данных с компонентом управления потоком данных")
    
    plt.xticks(xticks)
    plt.xlabel('Время непрерывного запроса данных (с)')
    plt.ylabel('Время обработки аудиоданных (с)')

    plt.legend()
    plt.show()
    
def throttler_cpu():
    x = [0, 1]
    y = [18, 84]
    
    plt.show()
    plt.bar(x, y)
    plt.xticks(x, ['Нагрузка ЦПУ с компонентом управления потоком данных', 'Нагрузка ЦПУ без компонента управления потоком данных'])
    plt.ylabel('Нагрузка ЦПУ (%)')

    plt.show()
    
def po_time():
    x = [0, 1, 2]
    y = [0.34, 0.3, 0.41]
    
    plt.show()
    plt.bar(x, y)
    plt.xticks(x, ['Программный комплекс', 'AVAudioPlayer', 'SwiftAudioPlayer'])
    plt.ylabel('Cреднее время обработки аудиоданных (c)')

    plt.show()

def po_ram():
    x = [0, 1, 2]
    y = [42, 47.88, 50.5]
    
    plt.show()
    plt.bar(x, y)
    plt.xticks(x, ['Программный комплекс', 'AVAudioPlayer', 'SwiftAudioPlayer'])
    plt.ylabel('Среднее количество выделяемой оперативной памяти (MB)')

    plt.show()
    

if __name__ == '__main__':
    po_time()
    # for view_type in VIEW_TYPES:
    # x = [1, 2, 3, 4, 5]
    # y = [1, 2, 3, 4, 5]
    # xticks = range(0, 5) 

        # with open(f'results/time_to_create_views/{view_type}s_results.json', 'r') as f:
        #     data_dict = json.load(f)

        # for key in data_dict:
        #     x.append(float(key))
        #     y.append(float(data_dict[key]))

    # x = np.array(x)
    # y = np.array(y)
    # plt.plot(x, y, label="Test" 
    #     # label=obtain_label(view_type=view_type),
    # )


    # plt.xticks(xticks)
    # plt.xlabel('Время непрерывного запроса данных (с)')
    # plt.ylabel('Время создания объектов классов графических компонент (с)')
    # plt.ylabel('Время обработки правил отображения (с)')
    # plt.title('График времени обработки правил отображения графических компонент для разных типов графических компонент')
    # plt.legend()
    # plt.show()

    # plt.savefig(f'plots/time_to_create_views.png')