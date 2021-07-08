export var effects = [
    { 'name': "effects", 'url': 'layout/video/effects.mp4', 'start_time': 36.5, 'end_time': 40 },
    { 'name': "effects", 'url': 'layout/video/effects.mp4', 'start_time': 8.5, 'end_time': 12.5 },
    { 'name': "effects", 'url': 'layout/video/effects.mp4', 'start_time': 44, 'end_time': 47 },
    { 'name': "effects", 'url': 'layout/video/effects.mp4', 'start_time': 50, 'end_time': 56 },
    { 'name': "effects", 'url': 'layout/video/effects.mp4', 'start_time': 69, 'end_time': 73 },
    { 'name': "effects", 'url': 'layout/video/effects.mp4', 'start_time': 85, 'end_time': 90 },
    { 'name': "chicka_scream", 'url': 'layout/video/chika_scream.mp4', 'start_time': 0, 'end_time': 0 },
]
export var right_effects = [
    { 'name': "Aot_OP", 'url': 'layout/video/aotop.mp4', 'start_time': 0, 'end_time': 0 },
    { 'name': "OhEffect", 'url': 'layout/video/oh.mp4', 'start_time': 0.5, 'end_time': 0 },
]

export function random_effect(effect_variable){
    var item = effect_variable[Math.floor(Math.random() * effect_variable.length)];
    return item;
}