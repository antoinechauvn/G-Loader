from g_python.htools import RoomUsers
from g_python.hparsers import HEntityType
from g_python.hmessage import Direction


class RoomIntercepter(RoomUsers):
    def __init__(self, extension, userlist, room_users='Users', room_model='RoomReady', remove_user='UserRemove', request='GetHeightMap', status='UserUpdate'):
        super().__init__(extension, room_users, room_model, remove_user, request, status)
        super().on_new_users(self.on_new_users)
        super().on_remove_user(self.on_remove_user)

        extension.intercept(Direction.TO_CLIENT, self.__clear_room_users, room_model)

        self.userlist = userlist
        self.locallist = []

    def duplicate(self, entity_name):
        print(f"Checking Duplicate for {entity_name}")
        return entity_name in self.locallist

    def on_new_users(self, entity_list):
        if (entity_list):
            for entity in entity_list:
                if entity.entity_type == HEntityType.HABBO:
                    if not self.duplicate(entity.name):
                        avatar_url = f"https://www.habbo.com.br/habbo-imaging/avatarimage?figure={entity.figure_id.split('&')[0]}&direction=3&size=l.0&head_direction=3&headonly=1"
                        self.locallist.append(entity.name)
                        self.userlist.list_append(entity.name, avatar_url)
    
    def __clear_room_users(self, _):
        self.room_users.clear()
        self.userlist.list_clear()
        self.locallist.clear()

    def on_remove_user(self, entity):
        if entity.entity_type == HEntityType.HABBO:
            index = self.locallist.index(entity.name)
            self.locallist.remove(entity.name)
            self.userlist.list_remove(index)
