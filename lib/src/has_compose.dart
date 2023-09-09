class Has {
  const Has();
}

class Compose {
  const Compose();
}

class HasDefault {
  final Object value;

  const HasDefault(this.value);
}

class Ext {
  final bool has;

  const Ext({
    this.has = false,
  });
}

const ext = Ext();
const extHas = Ext(has: true);

class HasOf<T> {
  const HasOf();
}
